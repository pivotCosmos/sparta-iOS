//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by 이정아 on 2022/09/01.
//

import UIKit
import Firebase
import GoogleMobileAds
import AppTrackingTransparency // 추가
import AdSupport // 추가

class FingerGameViewController: UIViewController {

    @IBOutlet weak var gameView: FingerGameView!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var secondsLeft = 5
    var interstitial: GADInterstitialAdBeta? // 추가
    var didOpenAd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameView.controller = self
        requestIDFA()
    }
    
    //광고준비하기
    func requestIDFA() {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
            let request = GADRequest()
            GADInterstitialAdBeta.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                                       request: request) { (ad, error) in
                if error != nil {
                    return
                }
                
                self.interstitial = ad
            }
        })
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var timer: Timer?
    func touchCountDidChange() {
        timer?.invalidate()
        
        Analytics.logEvent("GameStart", parameters: nil)
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
            
            for roundView in self.gameView.touchToRoundView.values {
                
                let randomChoice = Bool.random()
                
                UIView.animate(withDuration: 1){
                    if randomChoice {
                        roundView.backgroundColor = UIColor(named: "Cherry")
                    } else {
                        roundView.backgroundColor = UIColor(named: "Strawberry")
                    }
                    
                    let center = roundView.center // center는 struct이라서 참조주소가 아니라 값을 직접 넘겨준다. 따라서 이후에 roundView.center가 바뀌더라도 영향이 없다.
                    roundView.frame.size = CGSize(width: 120, height: 120)
                    roundView.layer.cornerRadius = 60
                    roundView.center = center
                }
            }
            
            Analytics.logEvent("GameEnd", parameters: ["touchCOunt":
                                                            self.gameView.touchToRoundView.count])
            if self.didOpenAd == false {
                self.interstitial?.present(fromRootViewController: self)
                self.didOpenAd = true
            }
            
        }
        
        resetSecondsTimer()
    }
    
    var secondsTimer: Timer?
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.values.count > 0 {
            
            self.secondsLeft = 5
            self.secondsLabel.text = "5"
            self.blinkSecondsLabel()
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] (t) in
                self.secondsLeft -= 1
                self.secondsLabel.text = "\(self.secondsLeft)"
                self.blinkSecondsLabel()
                
                if self.secondsLeft == 0 {
                    self.secondsLabel.text = ""
                    self.blinkSecondsLabel()
                    self.secondsTimer?.invalidate()
                }
            })
        } else {
            self.secondsLabel.text = ""
            self.blinkSecondsLabel()
        }
        
        
    }
    
    func blinkSecondsLabel() {
        self.secondsLabel.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.secondsLabel.alpha = 0
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

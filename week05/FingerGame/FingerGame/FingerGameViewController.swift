//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by 이정아 on 2022/09/01.
//

import UIKit

class FingerGameViewController: UIViewController {

    @IBOutlet weak var gameView: FingerGameView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameView.controller = self
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
    }
    
    var timer: Timer?
    func touchCountDidChang() {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
            
            for roundView in self.gameView.touchToRoundView.values {
                
                let randomChoice = Bool.random()
                
                if randomChoice {
                    roundView.backgroundColor = UIColor(named: "Cherry")
                } else {
                    roundView.backgroundColor = UIColor(named: "Cream")
                }
            }
            
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

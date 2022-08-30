//
//  ViewController.swift
//  RandomCatApp
//
//  Created by 이정아 on 2022/08/29.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNewCatImage()
    }
    
    @IBAction func refreshButtonClicked(_ sender: Any) {
        loadNewCatImage()
    }
    
    func loadNewCatImage(){
        AF.request("https://api.thecatapi.com/v1/images/search").responseDecodable(of: JSON.self) { (response) in
            if let value = response.value {
                let json = JSON(value)
                //print("json = \(json)")
                let url = json[0]["url"]
                //print("url = \(url)")
                self.catImageView.sd_setImage(with: URL(string: url.stringValue), completed: nil)
            }
        }
    }
}


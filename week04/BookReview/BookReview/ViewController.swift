//
//  ViewController.swift
//  BookReview
//
//  Created by 이정아 on 2022/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        AF.request("http://spartacodingclub.shop/review").responseDecodable(of: JSON.self){ (response) in
//            var json = JSON(response.value!)
//            print(json["reviews"][0])
//        }
        var parameters = [
            "title_give": "너무나도 쉬운 iOS 개발",
            "author_give": "버즈",
            "review_give": "재밌어요!"
        ]

        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
            var json = JSON(response.value!)
            print(json)
        }
    }


}


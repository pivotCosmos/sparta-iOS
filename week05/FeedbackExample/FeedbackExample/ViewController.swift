//
//  ViewController.swift
//  FeedbackExample
//
//  Created by 이정아 on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidClick(_sender: Any) {
        let impact = UIImpactFeedbackGenerator()
        impact.impactOccurred()
    }
}


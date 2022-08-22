//
//  ChickenOutputViewController.swift
//  FibonaChicken
//
//  Created by 이정아 on 2022/08/22.
//

import UIKit

class ChickenOutputViewController: UIViewController {

    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var chickenLabel: UILabel!
    
    var numberOfPeople: Int = 0
    var fibonachiList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        peopleLabel.text = "\(numberOfPeople)명이서\n먹는다면..."
        chickenLabel.text = "\(calculateChicken())마리를 시키거라"
    }
    
    func calculateChicken() -> Int{
        //  rule
        let peopleDivided = Double(numberOfPeople) / 1.618
        let chicken = round(peopleDivided)
        
        return Int(chicken)
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

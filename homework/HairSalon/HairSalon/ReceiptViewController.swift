//
//  ReceiptViewController.swift
//  HairSalon
//
//  Created by 이정아 on 2022/08/22.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    @IBOutlet weak var receiptLabel: UILabel!
    @IBOutlet weak var chargeButton: UIButton!
    
    var bleachNumber: Int = 0
    var dyeNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chargeButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        let totalPrice = bleachNumber*2000 + dyeNumber*5000
        receiptLabel.text = "탈색약 \(bleachNumber)개\n염색약\(dyeNumber)개\n\(totalPrice)원을 결제해주세요."
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        self.chargeButton.setTitle("결제완료", for: .normal)
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

//
//  ChickenInputViewController.swift
//  FibonaChicken
//
//  Created by 이정아 on 2022/08/22.
//

import UIKit

class ChickenInputViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultButton.layer.cornerRadius = 10
        //resultButton.clipsToBounds = True
    }
    

    @IBAction func textEditingChanged(_ sender: Any) {
        let text = textField.text ?? ""
        stepper.value = Double(text) ?? 0
    }
    @IBAction func stepperValueChanged(_ sender: Any) {
        let value = stepper.value
        textField.text = String(Int(value))
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let controller = segue.destination as? ChickenOutputViewController {
            controller.numberOfPeople = Int(stepper.value)
        }
        
    }
    

}

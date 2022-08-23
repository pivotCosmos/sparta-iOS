//
//  ColorPaletteViewController.swift
//  HairSalon
//
//  Created by 이정아 on 2022/08/22.
//

import UIKit

class ColorPaletteViewController: UIViewController {

    @IBOutlet weak var bleachNumberText: UITextField!
    @IBOutlet weak var bleachStepper: UIStepper!
    
    @IBOutlet weak var dyeNumberText: UITextField!
    @IBOutlet weak var dyeStepper: UIStepper!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.nextButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func bleachEditingChanged(_ sender: Any) {
        let bleachNumber = bleachNumberText.text ?? ""
        bleachStepper.value = Double(bleachNumber) ?? 0
    }
    
    @IBAction func bleachStepperValueChanged(_ sender: Any) {
        let bleachNumber = bleachStepper.value
        bleachNumberText.text = String(Int(bleachNumber))
    }
    
    @IBAction func dyeEditingChanged(_ sender: Any) {
        let dyeNumber = dyeNumberText.text ?? ""
        dyeStepper.value = Double(dyeNumber) ?? 0
    }
    @IBAction func dyeStepperValueChanged(_ sender: Any) {
        let dyeNumber = dyeStepper.value
        dyeNumberText.text = String(Int(dyeNumber))
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let controller = segue.destination as? ReceiptViewController{
            
            controller.bleachNumber = Int(bleachStepper.value)
            controller.dyeNumber = Int(dyeStepper.value)
            
        }
        
    }
    

}

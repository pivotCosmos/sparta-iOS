//
//  ColorPaletteViewController.swift
//  HairSalon
//
//  Created by 이정아 on 2022/08/22.
//

import UIKit

class ColorPaletteViewController: UIViewController {

    
    @IBOutlet var paletteImages: [UIImageView]!
    
    @IBOutlet weak var colorPickLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        print("Do Something")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tapImageViewRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        for palette in paletteImages {
            palette.isUserInteractionEnabled = true
            palette.addGestureRecognizer(tapImageViewRecognizer)
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

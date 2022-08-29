//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by 이정아 on 2022/08/25.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReviewWriteViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        let review = reviewTextField.text ?? ""
        
        if title.count == 0 || author.count == 0 || review.count == 0 {
            let alert = UIAlertController(title: "책리뷰", message: "모두 입력해주세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var parameter = [
            "title_give": title,
            "author_give": author,
            "review_give": review
        ]
        
        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameter).responseJSON { (response) in
            if var value = response.value {
                print(JSON(value))
                
                // 화면을 사라지게 합니다.
                self.navigationController?.popViewController(animated: true)
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

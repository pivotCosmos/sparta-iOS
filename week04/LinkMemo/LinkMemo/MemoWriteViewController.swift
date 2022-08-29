//
//  WriteViewController.swift
//  LinkMemo
//
//  Created by 이정아 on 2022/08/29.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftUI

class MemoWriteViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        urlTextField.layer.cornerRadius = 10
        urlTextField.layer.borderWidth = 1
        urlTextField.layer.borderColor = UIColor.gray.cgColor
        urlTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        urlTextField.leftViewMode = .always
        
        commentTextField.layer.cornerRadius = 10
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.borderColor = UIColor.gray.cgColor
        commentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        commentTextField.leftViewMode = .always
    }
    
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        var url = urlTextField.text ?? ""
        var comment = commentTextField.text ?? ""
        
        if url.count == 0 || comment.count == 0 {
            var alert = UIAlertController(title: "모두의 링크 메모장", message: "모두 입력해주세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var parameters = [
            "url_give": url,
            "comment_give": comment
        ]
        
        AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameters).responseDecodable(of: JSON.self) { (response) in
            if var value = response.value {
                print(JSON(value))
                
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

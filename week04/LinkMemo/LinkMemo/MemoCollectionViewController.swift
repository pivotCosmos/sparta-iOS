//
//  MemoCollectionViewController.swift
//  LinkMemo
//
//  Created by 이정아 on 2022/08/29.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class MemoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var memos: [JSON] = []
    var selectedMemo: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        AF.request("http://spartacodingclub.shop/post").responseDecodable(of: JSON.self) { (response) in
            if var value = response.value{
                var json = JSON(value)
                var memos = json["articles"].arrayValue
                self.memos = memos
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailPage"{
            if var controller = segue.destination as? MemoDetailViewController{
                controller.memo = self.selectedMemo
            }
        }
        
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemoCell", for: indexPath)
        
        var memo = memos[indexPath.item]
        
        // Configure the cell
        if var memoCell = cell as? MemoCollectionViewCell{
            memoCell.imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.frame.width / 3
        var height = width
        return CGSize(width: width, height: height)
    }
    
    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var memo = self.memos[indexPath.item]
        self.selectedMemo = memo
        self.performSegue(withIdentifier: "gotoDetailPage", sender: self)
    }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

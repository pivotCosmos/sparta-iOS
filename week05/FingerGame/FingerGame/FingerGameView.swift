//
//  FingerGameView.swift
//  FingerGame
//
//  Created by 이정아 on 2022/09/01.
//

import UIKit

class FingerGameView: UIView {

    weak var controller: FingerGameViewController?
    
    var touchToRoundView: [UITouch: UIView] = [:]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80)) //모서리에 위치한 정사각형
            view.center = touch.location(in: self) //x,y(정사각형 위치)가 알아서 바뀐다
            view.backgroundColor = UIColor(named: "Peach")
            view.layer.cornerRadius = 40 //80x80 정사각형을 반씩 깎아서 원으로 만든다
            
            self.touchToRoundView[touch] = view
            self.addSubview(view)
            
            self.controller?.touchCountDidChange()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = self.touchToRoundView[touch]
            view?.center = touch.location(in: self)
            
            self.controller?.touchCountDidChange()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChange()
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChange()
        }
    }
}

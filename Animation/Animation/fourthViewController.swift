//
//  fourthViewController.swift
//  Animation
//
//  Created by Alice Krutienko on 25.12.2020.
//

import UIKit

class fourthViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        let topView = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        topView.layer.cornerRadius = topView.frame.height / 2
        topView.backgroundColor = UIColor.init(red: 0/255, green: 144/255, blue: 114/255, alpha: 1)
        view.addSubview(topView)
        topView.setAnchorPoint(CGPoint(x: 0.5, y: 0.8))

        let bottomView = UIView(frame: CGRect(x: 100, y: 320, width: 200, height: 200))
        bottomView.layer.cornerRadius = bottomView.frame.height / 2
        bottomView.backgroundColor = UIColor.init(red: 172/255, green: 228/255, blue: 47/255, alpha: 1)
        view.addSubview(bottomView)
        bottomView.setAnchorPoint(CGPoint(x: 0.5, y: 0.2))
        
        UIView.animate(withDuration: 3, delay: 0.5, options:[ .autoreverse], animations: {
            bottomView.transform = CGAffineTransform(rotationAngle: .pi)
            topView.transform = CGAffineTransform(rotationAngle: .pi)
        }) { _ in
            bottomView.removeFromSuperview()
            topView.removeFromSuperview()
        }
    }
}
extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = point
    }
}



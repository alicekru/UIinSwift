//
//  secondViewController.swift
//  Animation
//
//  Created by Alice Krutienko on 25.12.2020.
//
import SpriteKit
import UIKit

class secondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    
    func setupAnimation() {
        let colorView = UIView()
        let insideView = UIView()
        colorView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        insideView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        insideView.layer.cornerRadius = insideView.frame.height / 2
        insideView.center = view.center
        colorView.center = view.center
        view.addSubview(colorView)
        view.addSubview(insideView)
        UIView.animate(withDuration: 0.2, delay: 0, options:[ .autoreverse], animations: {
             colorView.backgroundColor = UIColor.black
            insideView.backgroundColor = UIColor.white
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, options:[ .autoreverse], animations: {
                 colorView.backgroundColor = UIColor.red
                insideView.backgroundColor = UIColor.purple
            }, completion: { _ in
                    UIView.animate(withDuration: 0.2, delay: 0, options:[ .autoreverse], animations: {
                        colorView.backgroundColor = UIColor.green
                        insideView.backgroundColor = UIColor.yellow
                    }, completion: { _ in
                            UIView.animate(withDuration: 0.2, delay: 0, options:[ .autoreverse], animations: {
                                colorView.backgroundColor = UIColor.orange
                                insideView.backgroundColor = UIColor.systemPink
                            }, completion: { _ in
                                    UIView.animate(withDuration: 0.2, delay: 0, options:[ .autoreverse], animations: {
                                        colorView.backgroundColor = UIColor.white
                                        insideView.backgroundColor = UIColor.black
                                    }, completion: nil)
                                })
                        })
                })
            
        })
    }
}

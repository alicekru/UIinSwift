//
//  ViewController.swift
//  UIGestureRecognizers
//
//  Created by Alice Krutienko on 27.12.2020.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
   
    let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let colorArray = [UIColor.yellow, UIColor.orange, UIColor.red, UIColor.blue, UIColor.green, UIColor.purple]
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circleView.layer.cornerRadius = 20
        circleView.backgroundColor = .red
        circleView.center = view.center
        view.addSubview(circleView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
               leftSwipe.direction = .left
               self.view.addGestureRecognizer(leftSwipe)

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
               rightSwipe.direction = .right
               self.view.addGestureRecognizer(rightSwipe)

        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
               upSwipe.direction = .up
               self.view.addGestureRecognizer(upSwipe)

        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
               downSwipe.direction = .down
               self.view.addGestureRecognizer(downSwipe)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
                tap.delegate = self
                self.view.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
                doubleTap.numberOfTapsRequired = 2
                view.addGestureRecognizer(doubleTap)

         }

    @objc func swipeLeft() {
        UIView.animate(withDuration: 1.5, animations: {
            let center = self.circleView.center
            self.circleView.center = CGPoint(x: center.x - 30, y: center.y)
        }, completion: { (value: Bool) in
                UIView.animate(withDuration: 1.1, animations: {
                    self.circleView.backgroundColor = self.colorArray.randomElement()
                })
        })
    }

    @objc func swipeRight() {
        UIView.animate(withDuration: 1.5, animations: {
            let center = self.circleView.center
            self.circleView.center = CGPoint(x: center.x + 30, y: center.y)
        }, completion: { (value: Bool) in
                UIView.animate(withDuration: 0.1, animations: {
                    self.circleView.backgroundColor = self.colorArray.randomElement()
                })
        })
    }
    @objc func swipeUp() {
        UIView.animate(withDuration: 1.5, animations: {
            let center = self.circleView.center
            self.circleView.center = CGPoint(x: center.x, y: center.y - 30)
        }, completion: { (value: Bool) in
                UIView.animate(withDuration: 0.1, animations: {
                    self.circleView.backgroundColor = self.colorArray.randomElement()
                    })
            })
        }
    @objc func swipeDown() {
        UIView.animate(withDuration: 1.5, animations: {
            let center = self.circleView.center
            self.circleView.center = CGPoint(x: center.x, y: center.y + 30)
        }, completion: { (value: Bool) in
                UIView.animate(withDuration: 0.1, animations: {
                    self.circleView.backgroundColor = self.colorArray.randomElement()
                })
        })
    }
    
    @objc func tapped() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.center = self.view.center
            self.circleView.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        }
    
    @objc func doubleTapped() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { (value: Bool) in
            let orbit = CAKeyframeAnimation(keyPath: "position")
            var affineTransform = CGAffineTransform(rotationAngle: 0.0)
            affineTransform = affineTransform.rotated(by: CGFloat(Double.pi))
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: -80 ,y: 0), radius:  CGFloat(80), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
            orbit.path = circlePath.cgPath
            orbit.duration = 3
            orbit.isAdditive = true
            orbit.calculationMode = CAAnimationCalculationMode.paced
            orbit.rotationMode = CAAnimationRotationMode.rotateAuto
            self.circleView.layer.add(orbit, forKey: "orbit")
    })
}
}



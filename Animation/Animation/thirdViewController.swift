//
//  thirdViewController.swift
//  Animation
//
//  Created by Alice Krutienko on 25.12.2020.
//

import UIKit
import SpriteKit

class thirdViewController: UIViewController {

        let squareLayer = CAShapeLayer()
        let circleLayer = CAShapeLayer()
        var isSquare = true
        var layerAnimation = CABasicAnimation(keyPath: "path")
        
        override func viewDidLoad() {
            super.viewDidLoad()
        
            let layerCenter = CGPoint(x: 200, y: 200)
            let square = squarePathWithCenter(center: layerCenter, side: 200)
            squareLayer.path = square.cgPath
            squareLayer.fillColor = UIColor.init(red: 57/255, green: 198/255, blue: 254/255, alpha: 1).cgColor
            self.view.layer.addSublayer(squareLayer)
            
            let circle = circlePathWithCenter(center: layerCenter, radius: 100)
            circleLayer.path = circle.cgPath
            circleLayer.fillColor = UIColor.init(red: 57/255, green: 198/255, blue: 254/255, alpha: 1).cgColor
            
            layerAnimation.duration = 2
            layerAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            layerAnimation.fillMode = CAMediaTimingFillMode.forwards
            layerAnimation.isRemovedOnCompletion = false
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let touch = touches.first
            let point = touch!.location(in: self.view)
            if squareLayer.path!.contains(point) || circleLayer.path!.contains(point) {
                
                if isSquare {
                    layerAnimation.fromValue = squareLayer.path
                    layerAnimation.toValue = circleLayer.path
                    self.squareLayer.add(layerAnimation, forKey: "animatePath");
                } else {
                    layerAnimation.fromValue = circleLayer.path
                    layerAnimation.toValue = squareLayer.path
                    self.squareLayer.add(layerAnimation, forKey: "animatePath");
                }
                isSquare = !isSquare
            }
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func circlePathWithCenter(center: CGPoint, radius: CGFloat) -> UIBezierPath {
            let circlePath = UIBezierPath()
            circlePath.addArc(withCenter: center, radius: radius, startAngle: -CGFloat(Double.pi), endAngle: -CGFloat(Double.pi/2), clockwise: true)
            circlePath.addArc(withCenter: center, radius: radius, startAngle: -CGFloat(Double.pi/2), endAngle: 0, clockwise: true)
            circlePath.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi/2), clockwise: true)
            circlePath.addArc(withCenter: center, radius: radius, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi), clockwise: true)
            circlePath.close()
            return circlePath
        }
        
        func squarePathWithCenter(center: CGPoint, side: CGFloat) -> UIBezierPath {
            let squarePath = UIBezierPath()
            let startX = center.x - side / 2
            let startY = center.y - side / 2
            squarePath.move(to: CGPoint(x: startX, y: startY))
            squarePath.addLine(to: squarePath.currentPoint)
            squarePath.addLine(to: CGPoint(x: startX + side, y: startY))
            squarePath.addLine(to: squarePath.currentPoint)
            squarePath.addLine(to: CGPoint(x: startX + side, y: startY + side))
            squarePath.addLine(to: squarePath.currentPoint)
            squarePath.addLine(to: CGPoint(x: startX, y: startY + side))
            squarePath.addLine(to: squarePath.currentPoint)
            squarePath.close()
            return squarePath
        }
}
  


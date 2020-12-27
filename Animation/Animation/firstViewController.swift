//
//  ViewController.swift
//  Animation
//
//  Created by Alice Krutienko on 25.12.2020.
//

import UIKit

class firstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let blackView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        blackView.backgroundColor = .black
        blackView.center = view.center
        view.addSubview(blackView)
        UIView.animate(withDuration: 3, delay: 0.5, options: .curveEaseIn, animations: {
            blackView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            blackView.center = self.view.center
        }) { _ in
            blackView.removeFromSuperview()
        }
        
        
    }
}


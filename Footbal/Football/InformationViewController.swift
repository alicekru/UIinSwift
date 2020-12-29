//
//  InformationViewController.swift
//  BeyoundLimits
//
//  Created by Alice Krutienko on 24.12.2020.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet private weak var fotoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var videoViewContainer: UIView!
    @IBOutlet private weak var gameViewContainer: UIView!
    @IBOutlet private weak var informationLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewComponents()
    }
}

// MARK: - private
private extension InformationViewController {

    func configureViewComponents() {
        guard
            let videoView = Bundle.main.loadNibNamed("InformationChildView", owner: nil, options: nil)?.first as? InformationChildView else {
            return
        }
        videoViewContainer.addSubview(videoView)
        videoView.pinEdges(to: videoViewContainer)
        
        guard
            let gameView = Bundle.main.loadNibNamed("InformationChildView", owner: nil, options: nil)?.first as? InformationChildView else {
            return
        }
        gameViewContainer.addSubview(gameView)
        gameView.pinEdges(to: gameViewContainer)
    }
}

// MARK: - Action
private extension InformationViewController {
    @IBAction func videoCheckButtonTapped(_ sender: Any) {
    }
    @IBAction func gamesCheckButtonTapped(_ sender: Any) {
    }
    
}
extension UIView {
    
    func pinEdges(to other: UIView) {
        leadingAnchor.constraint(equalTo: other.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: other.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: other.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
    }
}


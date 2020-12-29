//
//  ConfirmationAllertView.swift
//  BeyoundLimits
//
//  Created by Alice Krutienko on 24.12.2020.
//

import UIKit

class ConfirmationAllertView: UIView {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
}
// MARK: - private
private extension ConfirmationAllertView {
    //self.textLabel.text = ""
}
// MARK: - Action
private extension ConfirmationAllertView {
    @IBAction func okTapped(_ sender: Any) {
    }
}

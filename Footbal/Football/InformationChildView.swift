//
//  IInformationChildView.swift
//  BeyoundLimits
//
//  Created by Alice Krutienko on 25.12.2020.
//

import UIKit

class InformationChildView: UIView {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var SecondImageView: UIImageView!
    @IBOutlet weak var CheckButton: UIButton!
}

extension Bundle {

    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }

        fatalError("Could not load view with type " + String(describing: type))
    }
}

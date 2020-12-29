//
//  GiweMeSomeDetails.swift
//  BeyoundLimits
//
//  Created by Alice Krutienko on 24.12.2020.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var confirmationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewComponents()
        confirmationButton.isEnabled = false
        nameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
}

// MARK: - private
private extension DetailsViewController {

   
    func configureViewComponents() {
        confirmationButton?.layer.cornerRadius = 15
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let name = nameTextField.text, !name.isEmpty
        else {
            confirmationButton.isEnabled = false
            return
        }
        confirmationButton.isEnabled = true
    }
}

// MARK: - Action
private extension DetailsViewController {

    @IBAction func confirmationButtonTapped(_ sender: Any) {
        let InformationController = InformationViewController()
        present(InformationController, animated: true)
    }
}



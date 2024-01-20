//
//  UITextField+Extension.swift
//  Validator
//
//  Created by Adjogbe  Tejiri on 20/01/2024.
//

import UIKit

public extension UITextField {
    func validate(rules: [Rule], errorLabel: UILabel? = nil) -> Bool {
        return SimpleValidator().validate(rules: rules, candidates: [ValidationCandidate(text: text ?? "", errorLabel: errorLabel)])
    }
}

//
//  Validator.swift
//  Validator
//
//  Created by Adjogbe  Tejiri on 15/01/2024.
//

import Foundation
import UIKit

public class SimpleValidator {
    public static func validate(rules: [Rule], candidates: [ValidationCandidate]) -> Bool {
        var isValid = true

        for candidate in candidates {
            if let failedRule = rules.first(where: { !$0.rule.validate(candidate.text) }) {
                isValid = false
                candidate.errorLabel?.text = failedRule.message
            } else {
                candidate.errorLabel?.text = ""
            }
        }

        return isValid
    }
}


//
//  ValidationCandidiate.swift
//  Validator
//
//  Created by Adjogbe  Tejiri on 20/01/2024.
//

import UIKit

public struct ValidationCandidate {
    var text: String
    var errorLabel: UILabel?
    
    public init(text: String, errorLabel: UILabel? = nil) {
        self.text = text
        self.errorLabel = errorLabel
    }
}

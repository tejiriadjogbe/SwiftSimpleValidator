//
//  Rule.swift
//  Validator
//
//  Created by Adjogbe  Tejiri on 20/01/2024.
//

import Foundation

public struct Rule {
    var rule: ValidatorRule
    var message: String
    
    init(rule: ValidatorRule, message: String) {
        self.rule = rule
        self.message = message
    }
    
    init(rule: SVRules, message: String) {
        self.rule = rule
        self.message = message
    }
}
//
//  main.swift
//  Infix-Postfix-Evaluation
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation

let evaluation = "((3+5)*5+(5-9))/5"
print("Evaluation: \(evaluation)\n")

if Operations.checkTheEvaluation(evaluation) {
    let result = Operations.infixToPostfixEvaluation(evaluation)
    print("Infix to Postfix result is = \(result)")
    print("Result of Infix = \(Operations.postfixEvaluate(result))")
} else {
    print("Evaluation is not correct!")
}

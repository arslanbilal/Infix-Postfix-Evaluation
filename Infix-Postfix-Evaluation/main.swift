//
//  main.swift
//  Infix-Postfix-Evaluation
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
if Operations.checkTheEvaluation("((3+5)*5+(5-9))/5") {
    let result = Operations.infixToPostfixEvaluation("((3+5)*5+(5-9))/5")
    println(result)
    println(Operations.postfixEvaluate(result))
}
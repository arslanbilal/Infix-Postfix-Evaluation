//
//  Operations.swift
//  Infix-Postfix-Evaluation
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation

class Operations {
    
    class func checkTheEvaluation(_ equation: String) -> Bool {
        
        func conjugate(_ item: Character) -> Character {
            if item == ")" {
                return "("
            } else if item == "]" {
                return "["
            } else {
                return "{"
            }
        }
        
        let stack: Stack = Stack<Character>(size: equation.characters.count)
        var isNumber: Bool = false
        
        for item in equation.characters {
            switch item {
            case "{", "(", "[":
                stack.push(item)
                isNumber =  false
            case "}", "]", ")":
                if !stack.isEmpty() && (stack.peek()! == conjugate(item)) {
                    stack.pop()
                    isNumber = false
                } else {
                    return false
                }
            case "+", "-", "*", "/":
                isNumber = false
                continue
            default:
                if isNumber == true {
                    return false
                } else {
                    isNumber = true
                }
            }
        }
        return true
    }
    
    class func infixToPostfixEvaluation(_ equation: String) -> String {
        var result: String = ""
        let stack: Stack = Stack<Character>(size: equation.characters.count)
        
        for char in equation.characters {
            switch char {
            case "+", "-", "*", "/":
                if char == "-" || char == "+" {
                    if stack.isEmpty() {
                        stack.push(char)
                    } else {
                        switch stack.peek()! {
                        case "+", "-", "/", "*":
                            while !stack.isEmpty() && (stack.peek()! == "+" || stack.peek()! == "-" || stack.peek()! == "*" || stack.peek()! == "/")  {
                                result.append(stack.pop()!)
                            }
                            stack.push(char)
                        default:
                            stack.push(char)
                        }
                    }
                } else {
                    if stack.isEmpty() {
                        stack.push(char)
                    } else {
                        switch stack.peek()! {
                        case "*", "/":
                            while (stack.peek()! == "*" || stack.peek()! == "/") && !stack.isEmpty() {
                                result.append(stack.pop()!)
                            }
                            stack.push(char)
                        default:
                            stack.push(char)
                        }
                    }
                }
            case "(", "{", "[":
                stack.push(char)
            case ")", "}", "]":
                while stack.peek() != "(" && stack.peek() != "{" && stack.peek() != "[" && !stack.isEmpty() {
                    result.append(stack.pop()!)
                }
                stack.pop()
            default:
                // its a number.
                result.append(char)
            }
        }
        while !stack.isEmpty() {
            if stack.peek()! == "(" || stack.peek()! == "{" || stack.peek()! == "[" {
                stack.pop()
            } else {
                result.append(stack.pop()!)
            }
        }
        
        return result
    }
    
    class func postfixEvaluate(_ equation: String) -> Double {
        var result = 0.0
        let stack = Stack<Double>(size: equation.characters.count)
        for item in equation.characters {
            if item == "+" {
                if stack.count() >= 2 {
                    let val2 = stack.pop()!
                    let val1 = stack.pop()!
                    result = val1 + val2
                    stack.push(result)
                }
            } else if item == "-" {
                if !stack.isEmpty() {
                    let val2 = stack.pop()!
                    let val1 = stack.pop()!
                    result = val1 - val2
                    stack.push(result)
                }
            } else if item == "*" {
                if !stack.isEmpty() {
                    let val2 = stack.pop()!
                    let val1 = stack.pop()!
                    result = val1 * val2
                    stack.push(result)
                }
            } else if item == "/" {
                if !stack.isEmpty() {
                    let val2 = stack.pop()!
                    let val1 = stack.pop()!
                    result = val1 / val2
                    stack.push(result)
                }
            } else {
                stack.push(Double(Int(String(item))!))
            }
        }
        
        return result
    }
}

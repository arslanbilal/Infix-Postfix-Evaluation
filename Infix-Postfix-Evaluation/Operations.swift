//
//  Operations.swift
//  Infix-Postfix-Evaluation
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation

class Operations {
    
    class func infixToPostfixEvaluation(equation: String) -> String {
        var result: String = ""
        var stack: Stack = Stack<Character>(size: countElements(equation))
        
        for char in equation {
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
    
    class func postfixEvaluate(equation: String) -> Double {
        var result = 0.0
        var stack = Stack<Double>(size: countElements(equation))
        for item in equation {
            if item == "+" {
                if stack.count() >= 2 {
                    var val2 = stack.pop()!
                    var val1 = stack.pop()!
                    result = val1 + val2
                    stack.push(result)
                }
            } else if item == "-" {
                if !stack.isEmpty() {
                    var val2 = stack.pop()!
                    var val1 = stack.pop()!
                    result = val1 - val2
                    stack.push(result)
                }
            } else if item == "*" {
                if !stack.isEmpty() {
                    var val2 = stack.pop()!
                    var val1 = stack.pop()!
                    result = val1 * val2
                    stack.push(result)
                }
            } else if item == "/" {
                if !stack.isEmpty() {
                    var val2 = stack.pop()!
                    var val1 = stack.pop()!
                    result = val1 / val2
                    stack.push(result)
                }
            } else {
                stack.push(Double(String(item).toInt()!))
            }
        }
        
        return result
    }
}
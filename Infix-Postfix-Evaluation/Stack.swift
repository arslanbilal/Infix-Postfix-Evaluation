//
//  Stack.swift
//  Infix-Postfix-Evaluation
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation

class Stack<T> {
    
    private var top: Int
    private var items: [T]
    var size:Int
    
    init() {
        top = -1
        items = [T]()
        size = 7
    }
    
    init(size: Int) {
        top = -1
        items = [T]()
        self.size = size
    }
    
    @discardableResult func push(_ item: T) -> Bool {
        if !isFull() {
            items.append(item)
            top += 1
            return true
        }
        return false
    }
    
    @discardableResult func pop() -> T? {
        if !isEmpty() {
            top -= 1
            return items.removeLast()
        }
        return nil
    }
    
    func peek() -> T? {
        if !isEmpty() {
            return items.last
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return top == -1
    }
    
    func isFull() -> Bool {
        return top == (size - 1)
    }
    
    func count() -> Int {
        return (top + 1)
    }
    
    func printStack() {
        print("-----")
        for item in items {
            print("| \(item) |")
        }
        print("-----")
    }
}

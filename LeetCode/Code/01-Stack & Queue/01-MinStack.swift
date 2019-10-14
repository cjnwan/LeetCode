//
//  01-MinStack.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/12.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MinStack1 {
    
    var stack = [Int]()
    var minStack = [Int]()
    
    
    func pop()->Int {
        let last = stack.removeLast()
        if last == getMin() {
            minStack.removeLast()
        }
        return last
    }
    
    func push(_ value:Int) {
        stack.append(value)
        if minStack.count == 0 {
            minStack.append(value)
        } else {
            if value < getMin() {
                minStack.append(value)
            }
        }
        
    }
    
    func getMin()->Int {
        return minStack.last!
    }
    
}

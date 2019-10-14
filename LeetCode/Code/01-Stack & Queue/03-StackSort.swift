//
//  03-StackSort.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/12.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class StackSort {
    
    // [2,4,5,1,3]
    func sort(_ stack:[Int]) {
        if stack.count < 2 {
            return
        }
        var stack = stack
        var helpStack = [Int]()
        
        while !stack.isEmpty {
            let top = stack.removeLast()
            while !helpStack.isEmpty && helpStack.last! > top {
                stack.append(helpStack.removeLast())
            }
            helpStack.append(top)
        }
        
        while !helpStack.isEmpty {
            stack.append(helpStack.removeLast())
        }
        
        print(stack)
    }
}

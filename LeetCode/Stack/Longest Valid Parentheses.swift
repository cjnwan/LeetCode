//
//   Longest Valid Parentheses.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class LongestValidParentheses {
    
    func longestValidParentheses(_ s: String) -> Int {
        let stack = Stack<Character>()
        var count = 0
        for c in s {
            if c == "(" {
                if count > 0 {
                    count -= 2
                }
                stack.push(c)
            } else if(stack.isEmpty) {
                continue;
            } else if(c == ")" && "(" == stack.pop()!) {
                count += 2
            }
        }
        return count
        
    }
}

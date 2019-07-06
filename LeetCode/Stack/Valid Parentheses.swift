//
//  Valid Parentheses.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        let stack = Stack<Character>()
        var dic = [Character:Character]()
        dic["{"] = "}"
        dic["("] = ")"
        dic["["] = "]"
    
        
        for c in s {
            if c == "{" || c == "(" || c == "[" {
                stack.push(c)
            } else if( stack.isEmpty || c != dic[stack.pop()!]) {
                return false
            }
        }
        
        return stack.isEmpty
    }
}

//
//  Remove All Adjacent Duplicates In String.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveDuplicates {
    func removeDuplicates(_ S: String) -> String {
        var stack = [Character]()
        
        for s in S {
            if stack.isEmpty || stack.last != s {
                stack.append(s)
            } else {
                stack.removeLast()
            }
        }
        
        return String(stack)
    }
}

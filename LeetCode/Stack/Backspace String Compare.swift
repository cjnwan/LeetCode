//
//  Backspace String Compare.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class BackspaceStringCompare {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let s = Stack<Character>()
        let t = Stack<Character>()
        
        for c in S {
            if c != "#" {
                s.push(c)
            } else {
               let _ = s.pop()
            }
        }
        
        for c in T {
            if c != "#" {
                t.push(c)
            } else {
               let _ = t.pop()
            }
        }
        
        if s.count != t.count {
            return false
        }
        
        while !s.isEmpty {
            if s.pop() != t.pop() {
                return false
            }
        }
        
        return true
    }
}

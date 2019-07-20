//
//  Valid Anagram.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/15.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ValidAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        let s = s.sorted()
        let t = t.sorted()
        
        return s==t
    }
}

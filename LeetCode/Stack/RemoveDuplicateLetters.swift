//
//  RemoveDuplicateLetters.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveDuplicateLetters {
    func removeDuplicateLetters(_ s: String) -> String {
        
        let Str = s
        var remove = [Int]()
        var dic = [Character:Int]()
        
        for (i,c) in Str.enumerated() {
            if dic.isEmpty || dic[c] == nil {
                dic[c] = i
            } else {
                remove.append(dic[c]!)
            }
        }
        
        var ss = ""
        
        for (i,c) in Str.enumerated() {
            if !remove.contains(i) {
                ss += String(c)
            }
        }
        
        return ss
    }
}

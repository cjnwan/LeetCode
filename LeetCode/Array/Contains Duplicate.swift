//
//  Contains Duplicate.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        var dict = [Int:Int]()
        for value in nums {
            if dict[value] != nil {
                return true
            } else {
                dict[value] = 1
            }
        }
        return false
        
    }
    
    func containsDuplicate1(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}

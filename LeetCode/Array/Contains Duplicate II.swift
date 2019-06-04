//
//  Contains Duplicate II.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ContainsDuplicate2 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        
        if nums.count > 5000 {
            return false
        }
        
        if k == 0 {
            return false
        }
        
        for i in 0..<nums.count {
            for j in 1...k {
                let k = i + j
                if i != k && k < nums.count && nums[i] == nums[k] {
                    return true
                }
            }
        }
        return false
    }
}

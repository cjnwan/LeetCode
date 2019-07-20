//
//  Remove Duplicates from Sorted Array II.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveDuplicatesfromSortedArray2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 3 {
            return nums.count
        }
        
        var index = 1
        for i in 2..<nums.count {
            if nums[index] != nums[index-1] || nums[index] != nums[i] {
                index += 1
                nums[index] = nums[i]
            }
        }
        
        return index + 1
    }
}


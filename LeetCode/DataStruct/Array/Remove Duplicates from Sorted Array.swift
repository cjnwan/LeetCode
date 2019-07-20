//
//  Remove Duplicates from Sorted Array.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveDuplicatesfromSortedArray {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        if nums.count < 2 {
            return nums.count
        }
        
        var endIndex = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i-1] {
                nums[endIndex] = nums[i]
                endIndex += 1
            }
        }
        return endIndex
    }
}

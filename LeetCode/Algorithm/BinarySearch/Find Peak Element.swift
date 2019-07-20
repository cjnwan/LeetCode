//
//  Find Peak Element.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/16.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class FindPeakElement {
    func findPeakElement(_ nums: [Int]) -> Int {
        
        if nums.count == 1 {
            return 0
        }
        
        if nums.count == 2 {
            return nums[0] < nums[1] ? 1 : 0
        }
        
        for i in 1..<nums.count {
            if nums[i] > nums[i-1] {
                if (i ==  nums.count - 1) || ( i < nums.count - 1  && nums[i] > nums[i+1]) {
                    return i
                }
            }
         }
        return 0
    }
}

//
//  3Sum.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/5.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted(by: <)
        var result = [[Int]]()
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            
            var left = i + 1,right = nums.count-1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[i],nums[left],nums[right]])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return result
    }
}

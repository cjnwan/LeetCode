//
//  3Sum Closest.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/5.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ThreeSumClosest {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        var nums = nums.sorted(by:<)
        var lastSum = nums[0] + nums[1] + nums[2]
        for i in 0..<nums.count {
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if abs(sum - target) < abs(lastSum - target) {
                    lastSum = sum
                }
                
                if target > sum {
                    left += 1
                } else if target < sum {
                    right -= 1
                } else {
                    return target
                }
            }
        }
        return lastSum
    }
}

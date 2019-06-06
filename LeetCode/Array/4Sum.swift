//
//  4Sum.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/5.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class FourSum {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        
        if nums.count < 4 {
            return []
        }
        
        var skipSum = nums[0];
        var nums = nums.sorted(by: <)
        var result = [[Int]]()
        for i in 0..<nums.count {
            if( i > 0 && nums[i]==nums[i-1]) {
                skipSum += nums[i]
                continue
            }
            
            for j in i+1..<nums.count {
                if( j - i > 0 && nums[j]==nums[j-1]) {
                    continue
                }
                var left = j + 1
                var right = nums.count - 1
                
                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if sum == target {
                        result.append([nums[i],nums[j],nums[left],nums[right]])
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        left += 1
                    }
                }
            }
        
        }
//        if skipSum == target {
//            return [nums]
//        }
        return result
    }
}

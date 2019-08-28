//
//  Longest Increasing Subsequence.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/28.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class LongestIncreasingSubsequence {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)
        
        var res = 0
        
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i],dp[j]+1)
                }
            }
            res = max(dp[i], res)
        }
        return res
    }
    
}

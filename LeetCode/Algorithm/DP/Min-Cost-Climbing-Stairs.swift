//
//  Min-Cost-Climbing-Stairs.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/21.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MinCostClimbingStairs {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        
        var dp = [Int](repeating: 0, count: cost.count)
        
        dp[0] = cost[0]
        dp[1] = cost[1]
        
        for i in 2..<cost.count {
            dp[i] = cost[i] + min(dp[i-1], dp[i-2])
        }
        
        return min(dp[cost.count-1], dp[cost.count-2])
    }
}

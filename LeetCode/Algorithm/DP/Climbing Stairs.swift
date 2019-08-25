//
//  Climbing Stairs.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/21.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ClimbingStairs {
    var dic = [Int:Int]()
    
    func climbStairs1(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        
        return climbStairs1(n-1)+climbStairs1(n-2)
    }
    
    func climbStairs2(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        
        if dic[n] != nil {
            return dic[n]!
        }
        let value = climbStairs2(n-1)+climbStairs2(n-2)
        dic[n] = value
        
        return value
    }
    
    func climbStairs3(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n+1)
        
        dp[1] = 1
        dp[2] = 2
        
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n]
    }
}

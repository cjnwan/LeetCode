//
//  Unique Paths.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/22.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                }
            }
        }
        return dp[m - 1][n - 1];
    }
}

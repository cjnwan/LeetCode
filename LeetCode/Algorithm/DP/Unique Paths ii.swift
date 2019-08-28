//
//  Unique Paths ii.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/26.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class UniquePathsii {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.count == 0 || obstacleGrid[0].count == 0 {
            return 0
        }
        
        let row = obstacleGrid.count
        let column = obstacleGrid[0].count
        
        var dp = [Int](repeating: 0, count: column)
        
        dp[0] = 1
        
        for i in 0..<row {
            dp[0] = obstacleGrid[i][0]==0 ?dp[0] : 0;
            for j in 1..<column {
                if obstacleGrid[i][j] == 0 {
                    dp[j] = dp[j] + dp[j-1]
                } else {
                    dp[j] = 0
                }
            }
        }
        
        return dp.last!
    }
}

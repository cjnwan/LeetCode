//
//   Island Perimeter.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/31.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class IslandPerimeter {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let column = grid[0].count
        var sum = 0
        for i in 0..<row {
            for j in 0..<column {
                let curr = grid[i][j]
                if curr == 1 {
                    sum += 4
                    if i-1>=0 && grid[i-1][j] == 1 {
                        sum -= 1
                    }
                    if j-1>=0 && grid[i][j-1] == 1 {
                        sum -= 1
                    }
                    if i + 1 < row && grid[i+1][j] == 1 {
                        sum -= 1
                    }
                    
                    if j + 1 < column && grid[i][j+1] == 1 {
                        sum -= 1
                    }
                }
            }
        }
        return sum;
    }
}

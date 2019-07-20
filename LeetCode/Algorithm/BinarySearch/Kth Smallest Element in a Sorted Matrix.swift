//
//  Kth Smallest Element in a Sorted Matrix.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/16.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class KthSmallestElementinaSortedMatrix {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var nums = [Int]()
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                nums.append(matrix[i][j])
            }
        }
        
        let result = nums.sorted()
        
        return result[k-1]
    }
}

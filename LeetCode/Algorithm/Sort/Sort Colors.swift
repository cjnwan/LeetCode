//
//  Sort Colors.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/15.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class SortColors {
    func sortColors(_ nums: inout [Int]) {
        let n = nums.count
        
        for i in 0..<n {
            for j in 0..<n-1-i {
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                }
            }
        }
    }
}

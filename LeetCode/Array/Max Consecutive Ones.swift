//
//  Max Consecutive Ones.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MaxConsecutiveOnes {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var consecutive = 0
        var max = 0
        for value in nums {
            if value == 1 {
                consecutive += 1
                if consecutive > max {
                    max = consecutive
                }
            } else {
                consecutive = 0
            }
        }
        return max
    }
}

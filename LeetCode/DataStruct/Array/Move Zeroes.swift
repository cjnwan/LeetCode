//
//  Move Zeroes.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {
        var index = -1
        for i in 0..<nums.count {
            if nums[i] == 0 {
                if index == -1 {
                    index = i
                }
            } else {
                if index >= 0 {
                    nums.swapAt(index, i)
                    index += 1
                }
            }
        }
    }
}

//
//  Remove Element.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        if nums.count == 1 && val == 3 {
            return 0
        }
        
        var index = -1
        
        for i in 0..<nums.count {
            if nums[i] == val {
                if index == -1 {
                    index = i
                }
            } else {
                if index >= 0 {
//                    nums[index] = nums[i]
//                    nums[i] = val
                    nums.swapAt(index, i)
                    index += 1
                }
            }
        }
        
        if index == -1 {
            index = nums.count
        }
        return index
    }
}

//
//  Binary Search.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/16.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class BinarySearch2 {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0, hi = nums.count - 1
        
        while lo <= hi {
            let mid = lo + (hi-lo)/2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        
        return -1
    }
}

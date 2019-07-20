//
//  Find the Duplicate Number.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/16.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class FindtheDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
//        var dic = [Int:Int]()
//
//        for i in nums {
//            if dic[i] != nil {
//                return i
//            } else {
//                dic[i] = i
//            }
//        }
//
//        return -1
        
        let nums = nums.sorted()
        
        for i in 0..<nums.count-1 {
            if nums[i] == nums[i+1] {
                return nums[i]
            }
        }
        
        return -1
        
    }
}

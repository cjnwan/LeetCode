//
//  TwoSum.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var startIndex = -1
        var endIndex = -1
        var flag = 0
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] + nums[j] == target {
                    startIndex = i
                    endIndex = j
                    flag = 1
                    break;
                }
            }
            if flag == 1 {
                break;
            }
        }
        if startIndex == -1 {
            return []
        } else {
            return [startIndex,endIndex]
        }
    }
    
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var map :[Int:Int] = Dictionary()
        for index in 0..<nums.count {
           if let startIndex = map[target - nums[index]] {
                return [startIndex,index]
            }
            map[nums[index]] = index
        }
        return []
        
    }
}

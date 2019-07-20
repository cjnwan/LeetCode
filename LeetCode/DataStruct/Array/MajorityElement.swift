//
//  majorityElement.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        for value in nums {
            if let item = dict[value] {
                dict[value] = item + 1
            } else {
                dict[value] = 1
            }
        }
        
        var max = 0
        var value = 0
        for key in dict.keys {
            if dict[key]! > max {
                max = dict[key]!
                value = key
            }
        }
        return value
    }
    
    func majorityElement1(_ nums: [Int]) -> Int {
        var value = nums[0]
        var count = 0
        
        for item in nums {
            if count == 0 {
                value = item
            }
            
            if item == value {
                count += 1
            } else {
                count -= 1
            }
        }
        
        return value
    }
}

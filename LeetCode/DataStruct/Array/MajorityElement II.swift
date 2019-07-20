//
//  MajorityElement2.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

// 摩尔投票法。该算法用于1/2情况，它说：“在任何数组中，出现次数大于该数组长度一半的值只能有一个。”
// 那么，改进一下用于1/3。可以着么说：“在任何数组中，出现次数大于该数组长度1/3的值最多只有两个。”
class MajorityElement2 {
 func majorityElement(_ nums: [Int]) -> [Int] {
    var value1 = 0
    var count1 = 0
    
    var value2 = 0
    var count2 = 0
    
    for item in nums {
        if (value1 == item || count1 == 0) && item != value2  {
            value1 = item
            count1 += 1
        } else if value2 == item || count2 == 0 {
            value2 = item
            count2 += 1
        } else {
            count1 -= 1
            count2 -= 1
        }
    }
    
    var count3 = 0
    var count4 = 0
    for item in nums {
        if value1 == item {
            count3 += 1
        }
        if value2 != value1 && value2 == item {
            count4 += 1
        }
    }
    
    var result = [Int]()
    if count3 > nums.count/3 {
        result.append(value1)
    }
    
    if count4 > nums.count/3 {
        result.append(value2)
    }
    
    return result
    
    }
}

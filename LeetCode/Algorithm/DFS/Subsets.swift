//
//  Subsets.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/20.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Subsets {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()
        var res = [[Int]]()
        var curr = [Int]()
        subsets1(nums,&res,&curr,0)
        return res
    }
    
    func subsets1(_ nums: [Int], _ res:inout[[Int]], _ curr:inout[Int], _ level:Int) {
        res.append(curr)
        
        for i in level..<nums.count {
            curr.append(nums[i])
            subsets1(nums, &res, &curr, i + 1)
            curr.removeLast()
        }
        
    }
}

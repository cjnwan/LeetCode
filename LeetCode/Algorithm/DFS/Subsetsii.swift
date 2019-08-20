//
//  Subsetsii.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/20.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Subsetsii {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()
        var res = [[Int]]()
        var curr = [Int]()
        var used = [Bool](repeating: false, count: nums.count)
        subsetsWithDup1(nums,&res,&curr,&used,0)
        return res
    }
    
    func subsetsWithDup1(_ nums: [Int], _ res:inout[[Int]], _ curr:inout[Int], _ used:inout[Bool], _ level:Int) {
        res.append(curr)
        
        for i in level..<nums.count {
            if !used[i] {
            if i > 0 && nums[i] == nums[i-1] && !used[i-1] {
                continue
            }
                used[i] = true
            curr.append(nums[i])
            subsetsWithDup1(nums, &res, &curr,&used, i + 1)
                used[i]=false
            curr.removeLast()
            }
        }
        
    }
}

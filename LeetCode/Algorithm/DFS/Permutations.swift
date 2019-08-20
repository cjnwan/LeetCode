//
//  Permutations.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/20.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Permutations {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let curr   = [Int]()
        var used = [Bool](repeating: false, count: nums.count)
        permute1(nums,&res,curr,0,&used)
        return res
    }
    
    func permute1(_ nums: [Int], _ res:inout [[Int]], _ curr:[Int], _ index:Int, _ used:inout[Bool]) {
        var curr = curr
        if index == nums.count {
            res.append(curr)
            return
        }
        for i in 0..<nums.count {
            if !used[i] {
                curr.append(nums[i])
                used[i] = true
                permute1(nums, &res, curr, index+1,&used)
                curr.removeLast()
                used[i] = false
            }
        }
    }
}

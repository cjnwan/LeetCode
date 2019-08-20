//
//  Permutationsii.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/20.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Permutations2 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()
        var res = [[Int]]()
        let curr   = [Int]()
        var used = [Bool](repeating: false, count: nums.count)
        permute1(nums,&res,curr,0,&used)
        return res
    }
    
    func permute1(_ nums: [Int], _ res:inout [[Int]], _ curr:[Int], _ index:Int, _ used:inout[Bool]) {
        var curr = curr
        if index == nums.count {
//            if !res.contains(curr) {
//                res.append(curr)
//            }
             res.append(curr)
            return
        }
        for i in 0..<nums.count {
            if !used[i] {
                if i>0 && nums[i] == nums[i-1] && !used[i-1] {
                    continue
                }
                curr.append(nums[i])
                used[i] = true
                permute1(nums, &res, curr, index+1,&used)
                curr.removeLast()
                used[i] = false
            }
        }
    }
}

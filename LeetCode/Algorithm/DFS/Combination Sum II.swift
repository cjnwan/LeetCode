//
//  Combination Sum II.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/20.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class CombinationSumII {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let can = candidates.sorted()
        var res = [[Int]]()
        var curr = [Int]()
        var used = [Bool](repeating: false, count: candidates.count)
        combinationSum1(can, target, &res, &curr,&used,0)
        return res
    }
    
    
    func combinationSum1(_ candidates: [Int], _ target: Int, _ res:inout[[Int]], _ curr:inout[Int], _ used:inout [Bool], _ level:Int) {
        
        let sum = curr.reduce(0, +)
        
        if  sum > target {
            return
        }
        
        if sum == target {
            res.append(curr)
            return
        }
        
        
        for i in level..<candidates.count {
            if !used[i] {
                if i > 0 && candidates[i] == candidates[i-1] && !used[i-1] {
                    continue
                }
                curr.append(candidates[i])
                used[i] = true
                combinationSum1(candidates, target, &res, &curr,&used,i+1)
                curr.removeLast()
                used[i] = false
            }
            
        }
    }
}

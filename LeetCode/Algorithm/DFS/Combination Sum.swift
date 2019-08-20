//
//  Combination Sum.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/20.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class CombinationSum {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let can = candidates.sorted()
        var res = [[Int]]()
        var curr = [Int]()
        combinationSum1(can, target, &res, &curr,0)
        return res
    }
    
    
    func combinationSum1(_ candidates: [Int], _ target: Int, _ res:inout[[Int]], _ curr:inout[Int], _ level:Int) {
        
        let sum = curr.reduce(0, +)
        
        if  sum > target {
            return
        }
        
        if sum == target {
            res.append(curr)
            return
        }
        
        
        for i in level..<candidates.count {
            curr.append(candidates[i])
            combinationSum1(candidates, target, &res, &curr,i)
            curr.removeLast()
        }
    }
}

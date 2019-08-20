//
//  Combinations.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/20.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Combinations {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var curr  = [Int]()
        combine1(n, k,&res,&curr,1)
        
        return res
    }
    
    func combine1(_ n: Int, _ k: Int, _ res:inout[[Int]], _ curr:inout[Int],_ level:Int) {
        
        if curr.count == k {
            res.append(curr)
            return
        }
        
        if level > n{
            return
        }
        
        for i in level...n {
            curr.append(i)
            combine1(n, k, &res, &curr,i+1)
            curr.removeLast()
        }
    }
}

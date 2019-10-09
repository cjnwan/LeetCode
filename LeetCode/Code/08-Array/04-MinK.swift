//
//  04-MinK.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/9.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

// Top K

class MinK {
    
    // O nlogn(sorted or heap)
    func findMinK(_ nums:[Int], _ k:Int) -> [Int] {
        if nums.count <= k {
            return nums.sorted()
        }
        
        let sortedNums = nums.sorted()
        
        var res = [Int]()
        for i in 0..<k {
            res.append(sortedNums[i])
        }
        return res
    }
    
    // O n (BFPRT)
    func findMinK1(_ nums:[Int], _ k:Int) -> [Int] {
        if nums.count <= k {
            return nums.sorted()
        }
        
        let sortedNums = nums.sorted()
        
        var res = [Int]()
        for i in 0..<k {
            res.append(sortedNums[i])
        }
        return res
    }
}

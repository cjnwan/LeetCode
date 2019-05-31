//
//  Sort Array By Parity.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class SortArrayByParity {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var even:[Int] = []
        var odd:[Int] = []
        
        for value in A {
            if value%2 == 0 {
                even.append(value)
            } else {
                odd.append(value)
            }
        }
        return even+odd
    }
    func sortArrayByParity1(_ A: [Int]) -> [Int] {
        var i = 0
        var j = A.count-1
        var AA = A
        
        while i < j {
            if AA[i]%2 == 1 && AA[j]%2 == 0 {
                AA.swapAt(i, j)
                i+=1
                j-=1
            } else if AA[i]%2 == 1 && AA[j]%2 == 1 {
                j-=1
            } else {
                i+=1
            }
        }
        return AA
    }
}

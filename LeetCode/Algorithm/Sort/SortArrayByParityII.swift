//
//  SortArrayByParityII.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/15.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class SortArrayByParityTwo {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        
        var A = A
        let n = A.count
        
        if n < 2 {
            return A
        }
        
        var odd = 1, even = 0
        
        while odd < n && even < n {
            while odd < n && A[odd]%2 != 0 {
                odd += 2
            }
            
            while even < n && A[even]%2 != 1 {
                even += 2
            }
            
            if odd < n && even < n {
                A.swapAt(odd, even)
            }
        }
        return A
    }
}

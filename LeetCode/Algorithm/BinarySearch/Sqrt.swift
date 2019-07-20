//
//  Sqrt.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/16.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Sqrt {
    func mySqrt(_ x: Int) -> Int {
        
//        if x == 1 {
//            return 1
//        }
//
//        var a = x/2
//
//        while a*a > x {
//            a -= 1
//        }
//
//        return a
        
        if x < 2 {
            return x
        }
        
        var lo = 1, hi = Int.max
        
        while lo < hi {
            let mid = lo + (hi - lo)/2 + 1
            
            let a = x/mid
            if a == mid {
                return mid
            } else if a > mid {
                lo = mid
            } else {
               hi = mid - 1
            }
        }
        return lo
        
    }
}

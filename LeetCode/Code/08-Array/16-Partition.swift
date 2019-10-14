//
//  16-Partition.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Partition {
    func partition(_ arr:[Int]) {
        if arr.count < 2 {
            return
        }
        var arr = arr
        
        var u = 0
        var i = 1
        
        while i < arr.count {
            if arr[u] != arr[i] {
                i += 1
                u += 1
                arr.swapAt(u, i-1)
            } else {
                i += 1
            }
        }
        
        print(arr)
    }
    
    func partition1(_ arr:[Int]) {
        if arr.count < 2 {
            return
        }
        var arr = arr
        
        var left = -1
        var right = arr.count
        var index = 0
        
        while index < right {
            if arr[index] == 0 {
                left += 1
                arr.swapAt(left, index)
                index += 1
            } else if arr[index] == 2 {
                right -= 1
                arr.swapAt(index, right)
            } else {
                left += 1
            }
        }
        
        print(arr)
    }
}

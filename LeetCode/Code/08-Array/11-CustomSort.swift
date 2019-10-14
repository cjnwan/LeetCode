//
//  11-CustomSort.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class CustomSort {
    func sort(_ arr:[Int])->[Int] {
        if arr.count < 2 {
            return arr
        }
        var arr = arr
        for i in 0..<arr.count {
            var temp = arr[i]
            while arr[i] != i+1 {
                let next = arr[temp-1]
                arr[temp-1] = temp
                temp = next
            }
        }
        return arr
    }
    
    func sort1(_ arr:[Int])->[Int] {
        if arr.count < 2 {
            return arr
        }
        var arr = arr
        for i in 0..<arr.count {
            while arr[i] != i+1 {
                arr.swapAt(i, arr[i]-1)
            }
        }
        return arr
    }
}

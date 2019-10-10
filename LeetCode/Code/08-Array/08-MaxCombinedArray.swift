//
//  08-MaxCombinedArray.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/10.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MaxCombineArray {
    func getMaxCombinedArrayLength(_ arr:[Int]) -> Int {
        if arr.count == 0 {
            return 0
        }
        
        var length = 0
        
        for i in 0..<arr.count {
            for j in (i+1)..<arr.count {
                if isCombined(arr, i, j) {
                   length = max(length, j-i)
                }
            }
        }
        return length
    }
    
    func isCombined(_ arr:[Int], _ i:Int, _ j:Int) -> Bool {
        let subArr = arr[i..<j].sorted()
        for i in 1..<subArr.count {
            if abs(subArr[i] - subArr[i-1]) != 1 {
                return false
            }
        }
        return true
    }
    
    func getMaxCombinedArrayLength2(_ arr:[Int]) -> Int {
        if arr.count == 0 {
            return 0
        }
        
        var length = 0
        
        for i in 0..<arr.count {
            var maxValue = Int.min
            var minValue = Int.max
            for j in i..<arr.count {
                maxValue = max(maxValue, arr[j])
                minValue = min(minValue, arr[j])
                if maxValue - minValue == j - i {
                    length = max(length, j - i + 1)
                }
            }
        }
        return length
    }
}

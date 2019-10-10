//
//  05-MinLength.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/10.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MinLength {
    
    func getMinLength(_ arr:[Int]) -> Int {
        
        var minIndex = -1
        var minValue = arr.last!
        
        for i in stride(from: arr.count-2, to: 0, by: -1) {
            if arr[i] > minValue {
                minIndex = i
            } else {
                minValue = min(minValue, arr[i])
            }
        }
        
        if minIndex == -1 {
            return 0
        }
        
        var maxValue = arr.first!
        var maxIndex = -1
        for i in 1..<arr.count {
            if arr[i] < maxValue {
                maxIndex = i
            } else {
                maxValue = max(maxValue, arr[i])
            }
        }
        
        return maxIndex - minIndex + 1
    }
}

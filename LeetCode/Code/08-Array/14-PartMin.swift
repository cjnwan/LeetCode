//
//  14-PartMin.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class PartMin {
    
    func getPartMin(_ arr:[Int])->Int {
        if arr.count == 0 {
            return -1
        }
        
        if arr.count < 2 {
            return 0
        }
        
        if arr[arr.count-1] < arr[arr.count-2] {
            return arr.count-1
        }
        
        var left = 1
        var right = arr.count - 2
        var mid = 0
        
        while left < right {
            mid = (left + right)/2
            if arr[mid] > arr[mid-1] {
                right = mid - 1
            } else if arr[mid] < arr[mid-1] {
                left = mid + 1
            } else {
                return mid
            }
        }
        return left
    }
}

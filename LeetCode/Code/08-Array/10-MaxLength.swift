//
//  10-MaxLength.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/10.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MaxLength {
    func getMaxLength(_ arr:[Int], _ k:Int) -> Int {
        if arr.count == 0 || k < 0 {
            return 0
        }
        
        var left = 0
        var right = 0
        var length = 0
        var sum = arr.first!
        while right < arr.count {
            if sum == k {
                length = max(length, right-left+1)
                sum -= arr[left]
                left += 1
            } else if sum < k {
                right += 1
                if right >= arr.count {
                    break;
                }
                sum += arr[right]
            } else {
                sum -= arr[left]
                left += 1
            }
        }
        return length
    }
    
    func getMaxLength2(_ arr:[Int], _ k:Int) -> Int {
        if arr.count == 0 || k < 0 {
            return 0
        }
        var sum = 0
        var len = 0
        var map = [Int:Int]()
        map[0] = -1
        
        for i in 0..<arr.count {
            sum += arr[i]
            
            if map[sum-k] != nil {
                len = max(len, i-map[sum-k]!)
            } else {
                map[sum] = i
            }
        }
        return len
    }
}

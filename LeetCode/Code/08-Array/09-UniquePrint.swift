//
//  09-UniquePrint.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/10.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class UniquePrint {
    
    func twoPrint(_ arr:[Int], _ k:Int) {
        if arr.count < 2 {
            return
        }
        
        var left = 0
        var right = arr.count - 1
        while left < right {
            if arr[left] + arr[right] == k {
                if left == 0 || arr[left] != arr[left - 1] {
                    print(arr[left], arr[right])
                    left += 1
                    right -= 1
                }
            } else if(arr[left] + arr[right] > k) {
                right -= 1
            } else {
                left += 1
            }
        }
    }
    
    func threePrint(_ arr:[Int],_ k:Int) {
        if arr.count < 2 {
            return
        }
        
        for i in 0..<arr.count {
            if i == 0 || arr[i] != arr[i-1] {
                printResult(arr, i, i+1, arr.count-1, k-arr[i])
            }
        }
    }
    
    func printResult(_ arr:[Int], _ f:Int, _ l:Int, _ r:Int, _ k:Int) {
        var l = l
        var r = r
        while l < r {
            if arr[l] + arr[r] > k {
                r -= 1
            } else if arr[l] + arr[r] < k {
                l += 1
            } else {
                if (f + 1 == l || arr[l] != arr[l-1]) {
                    print(arr[f],arr[l], arr[r])
                    l += 1
                    r -= 1
                }
               
            }
        }
    }
}

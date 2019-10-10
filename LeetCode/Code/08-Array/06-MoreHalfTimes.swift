//
//  06-MoreHalfTimes.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/10.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

// https://zhuanlan.zhihu.com/p/39538880

class MoreHalfTimes {
    
    func getMoreHalfTimesValue(_ arr:[Int]) -> Int {
        
        var count = 0
        var curr = 0
        
        for i in 1..<arr.count {
            if count == 0 {
                curr = arr[i]
                count += 1
            } else if(arr[i] == curr) {
                count += 1
            } else {
                count -= 1
            }
        }
        
        count = 0
        for i in 0..<arr.count {
            if arr[i] == curr {
                count += 1
            }
        }
        
        if count > arr.count/2 {
            return curr
        }
        
        return 0
    }
}

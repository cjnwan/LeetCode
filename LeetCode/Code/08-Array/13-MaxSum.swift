//
//  13-MaxSum.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MaxSum {
    func getMaxSum(_ arr:[Int]) ->Int {
        var res = arr.first!
        var cur = arr.first!
        
        for i in 1..<arr.count {
            cur = cur > 0 ? cur : 0
            cur += arr[i]
            res = max(res, cur)
        }
        return res
    }
    
    func getMaxMultipy(_ arr:[Int]) -> Int {
        if arr.count == 0 {
            return 0
        }
        
        var maxV = arr.first!
        var minV = arr.first!
        var res = arr.first!
        
        var maxEnd  = 0
        var minEnd = 0
        
        for i in 1..<arr.count {
            maxEnd = maxV * arr[i]
            minEnd = minV * arr[i]
            
            maxV = max(max(maxEnd,minEnd), arr[i])
            minV = min(min(maxEnd,minEnd), arr[i])
            
            res = max(res, maxV)
        }
        
        return res
    }
}

//
//  15-MultipyValue.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MultipyValue {
    func showMultipy(_ arr:[Int]) {
        var sum = 1
        var count = 0
        var arr = arr
        for i in 0..<arr.count {
            if arr[i] != 0 {
                sum *= arr[i]
            } else {
                count += 1
            }
        }
        
        if count == 0 {
            for i in 0..<arr.count {
                arr[i] = sum/arr[i]
            }
        } else if count == 1 {
            for i in 0..<arr.count {
                if arr[i] == 0 {
                    arr[i] = sum
                } else {
                    arr[i] = sum/arr[i]
                }
            }
        } else {
            for i in 0..<arr.count {
                arr[i] = 0
            }
        }
        print(arr)
    }
}

//
//  17-MinNumber.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation


class MinNumber {
    func getMinNumber(_ arr:[Int])->Int {
        if arr.count == 0 {
            return 1
        }
        var arr = arr
        for i in 0..<arr.count {
            while arr[i] > 0 && arr[i] - 1 < arr.count && arr[i]-1 != i{
                arr.swapAt(i, arr[i] - 1)
            }
        }
        
        for i in 0..<arr.count {
            if i != arr[i] - 1 {
                return i + 1
            }
        }
        
        return arr.count + 1
    }
}

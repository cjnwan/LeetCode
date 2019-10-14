//
//  12-OddEven.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class OddEven {
    func oddEvenOrdeded(_ arr:[Int]) {
        var arr = arr
        var odd = 1
        var even = 0
        let count = arr.count - 1
        
        while odd <= count && even <= count {
            if arr[count] % 2 == 0  {
                arr.swapAt(count, even)
                even += 2
            } else {
                arr.swapAt(count, odd)
                odd += 2
            }
        }
        
        print(arr)
    }
}

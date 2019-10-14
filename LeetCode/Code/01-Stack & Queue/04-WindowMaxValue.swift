//
//  04-WindowMaxValue.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/12.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class WindowsMaxValue {
    func getMaxValue(_ arr:[Int], _ k:Int)->[Int] {
        if arr.count < 2 {
            return arr
        }
        
        var res = [Int]()
        var queue = [Int]()
        
        for i in 0..<arr.count {
            while !queue.isEmpty && arr[i] >= arr[queue.last!] {
                queue.removeLast()
            }
            queue.append(i)
            
            if queue.first! == i-k {
                queue.removeFirst()
            }
            
            if i + 1 >= k {
                res.append(arr[queue.first!])
            }
        }
        
        return res
    }
}

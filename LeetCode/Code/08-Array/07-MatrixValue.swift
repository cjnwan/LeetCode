//
//  07-MatrixValue.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/10.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MatrixValue {
    func findMatrixValue(_ arr:[[Int]], _ k:Int)->Bool {
        
        var row = 0
        var col = arr.first!.count - 1 
        
        while row < arr.count && col > -1 {
            if arr[row][col] == k {
                return true
            } else if arr[row][col] > k {
                col -= 1
            } else {
                row += 1
            }
        }
        return false
    }
}

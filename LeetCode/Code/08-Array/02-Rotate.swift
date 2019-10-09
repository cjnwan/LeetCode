//
//  02-Rotate.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/9.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RoateMatrix {
    
    func matrix(_ points: [[Int]]) {
        var rowStart = 0
        var rowEnd = points.count - 1
        var columnStart = 0
        var columnEnd = points[0].count - 1
        var points = points
        
        while rowStart <= rowEnd {
            matrixPrint(&points, rowStart, rowEnd, columnStart, columnEnd)
            rowStart += 1
            rowEnd -= 1
            columnStart += 1
            columnEnd -= 1
        }
        print(points)
    }
    
    func matrixPrint(_ m: inout [[Int]], _ rS:Int, _ rE:Int, _ cS:Int, _ cE:Int) {
        
        let times = cE - cS
        var temp = 0
        
        for i in 0..<times {
            temp = m[rS][cS + i]
            m[rS][cS + i] = m[rE-i][cS]
            m[rE-i][cS] = m[rE][cE-i]
            m[rE][cE-i] = m[rS+i][cE]
            m[rS+i][cE] = temp
        }
    }
}

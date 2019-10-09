//
//  Matrix.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/9.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ArrayMatrix {
    
    func matrix(_ points: [[Int]]) {
        var rowStart = 0
        var rowEnd = points.count - 1
        var columnStart = 0
        var columnEnd = points[0].count - 1
        
        while rowStart <= rowEnd && columnStart <= columnEnd {
            
            matrixPrint(points, rowStart, rowEnd, columnStart, columnEnd)
            rowStart += 1
            rowEnd -= 1
            columnStart += 1
            columnEnd -= 1
        }
    }
    
    func matrixPrint(_ m: [[Int]], _ rS:Int, _ rE:Int, _ cS:Int, _ cE:Int) {
        if rS == rE { //
            for i in cS..<cE {
                print(m[rS][i], terminator: " ")
            }
        } else if cS == cE {
            for i in rS..<rE {
                print(m[cS][i], terminator: " ")
            }
        } else {
            var currC = cS
            var currR = rS
            
            while currC != cE { // top row
                print(m[rS][currC], terminator: " ")
                currC += 1
            }
            
            while currR != rE { // right column
                print(m[currR][cE], terminator: " ")
                currR += 1
            }
            
            while currC != cS { // bottom row
                print(m[rE][currC], terminator: " ")
                currC -= 1
            }

            while currR != rS { // left column
                print(m[currR][cS], terminator: " ")
                currR -= 1
            }
        }
    }
}

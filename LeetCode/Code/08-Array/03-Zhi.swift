//
//  03-Zhi.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/9.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class ZhiMatrix {
    
    func matrix(_ points: [[Int]]) {
        var tR = 0
        var tC = 0
        var bR = 0
        var bC = 0
        let endR = points.count - 1
        let endC = points.first!.count - 1
        var points = points
        var fromUp = false
        
        while tR != endR + 1 {
            printLevel(&points, tR, tC, bR, bC, fromUp)
            tR = tC == endC ? tR + 1 : tR
            tC = tC == endC ? tC  : tC + 1
            bC = bR == endR ? bC + 1 : bC
            bR = bR == endR ? bR : bR + 1
            fromUp = !fromUp
        }
    }
    
    func printLevel(_ m: inout [[Int]], _ tR:Int, _ tC:Int, _ bR:Int, _ bC:Int, _ fromUp:Bool ) {
        var tR = tR, tC = tC, bR = bR, bC = bC
        if fromUp {
            while tR != bR + 1 {
                print(m[tR][tC], terminator: " ")
                tR += 1
                tC -= 1
            }
        } else {
            while bR != tR - 1 {
                print(m[bR][bC], terminator: " ")
                bR -= 1
                bC += 1
            }
        }
    }
}

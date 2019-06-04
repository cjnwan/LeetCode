//
//  Number of Boomerangs.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/31.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class NumberOfBoomerangs {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        var count = 0
        var dict = [Int:Int]()
        for i in 0..<points.count {
            dict.removeAll()
            for j in 0..<points.count {
                if i != j {
                    let distance =  (points[j][0] - points[i][0])*(points[j][0] - points[i][0]) + (points[j][1] - points[i][1])*(points[j][1] - points[i][1])
                    if let value = dict[distance] {
                        dict[distance] = value + 1
                    } else {
                          dict[distance] =  1
                    }
                }
            }
            for key in dict.keys {
                 count += dict[key]! * (dict[key]! - 1)
            }
        }
        return count
    }
}

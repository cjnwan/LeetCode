//
//  Heaters.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/31.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Heaters {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        let houses = houses.sorted()
        let heaters = heaters.sorted()
        var radius = 0
        var i = 0
        for house in houses {
            while i < heaters.count - 1 && abs(heaters[i + 1] - house) <= abs(heaters[i] - house) {
                i+=1
            }
            radius = max(radius, abs(heaters[i]-house))
        }
        return radius
    }
}

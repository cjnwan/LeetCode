//
//  Best Time to Buy and Sell Stockii.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/27.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class BestTimetoBuyandSellStockii {
    
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        var max = 0
        var min = Int.max
        for i in 0..<count {
            if prices[i] < min {
                min = prices[i]
            }
            
            if prices[i]>min {
                max +=  prices[i]-min
                min = prices[i]
            }
        }
        return max
    }
}

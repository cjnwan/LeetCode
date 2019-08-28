//
//  Best Time to Buy and Sell Stock.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/27.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class BestTimetoBuyandSellStock {
    
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        var max = 0
        var min = Int.max
        for i in 0..<count {
            if prices[i] < min {
                min = prices[i]
            }
            
            if prices[i]-min > max {
                max =  prices[i]-min
            }
        }
        return max
    }
    
    func maxProfit1(_ prices: [Int]) -> Int {
        let count = prices.count
        var max = 0
        for i in 0..<count {
            for j in (i+1)..<count {
                if prices[j] < prices[i] {
                    continue
                }
                if prices[j] - prices[i] > max {
                    max = prices[j] - prices[i]
                }
            }
        }
        return max
    }
}

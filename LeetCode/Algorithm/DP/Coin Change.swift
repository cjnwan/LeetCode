//
//  Coin Change.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/8/28.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class CoinChange {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        var dp = [Int](repeating: amount+1, count: amount+1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], dp[i-coin]+1)
                }
            }
        }
        
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

//
//  String.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/23.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

extension String  {
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    func subString(_ start:Int, end:Int) -> String {
        var end = end
        if end > self.count {
            end = self.count
        }
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        return String(self[startIndex..<endIndex])
    }
}

// Brute-Force String Search
extension String {
    func bfSearch(_ pattern:String) -> Int? {
        for i in 0..<self.count {
            var index = i
            var found = true
            
            for j in 0..<pattern.count {
                if index == pattern.count || self[index] != pattern[j] {
                    found = false
                    break
                } else {
                    index = index + j + 1
                }
            }
            
            if found {
                return i
            }
            
        }
        return nil
    }
}

//Rabin-Karp String Search
extension String {
    func rkSearch(_ pattern:String) -> Int? {
        let plength = pattern.count
        let phash = pattern.hash
        
        for i in 0..<self.count {
            if plength + i >= self.count {
                break
            }
            let subString = self.subString(i, end: i+plength)
            if subString.hash == phash {
                for j in 0..<plength {
                    if subString[j] != pattern[j] {
                        break
                    }
                    if j == plength-1 {
                        return i
                    }
                }
            }
        }
        return nil
    }
}

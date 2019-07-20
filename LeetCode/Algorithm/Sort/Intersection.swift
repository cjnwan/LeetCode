//
//  Intersection.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/15.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Intersection {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var dic = [Int:Int]()
        
        for i in nums1 {
            for j in nums2 {
                if i == j && dic[i] == nil {
                    dic[i] = 1
                }
            }
        }
        return Array(dic.keys)
    }
}

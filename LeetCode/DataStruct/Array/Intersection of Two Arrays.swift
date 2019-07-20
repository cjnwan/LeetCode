//
//  Intersection of Two Arrays.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class IntersectionofTwoArrays {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int:Int]()
        for i in nums1 {
            for j in nums2 {
                if i == j {
                    if dict[i] != nil {
                        continue
                    } else {
                        dict[i] = 1
                    }
                }
            }
        }
        var result = [Int]()
        for key in dict.keys {
            result.append(key)
        }
        
        return result
    }
    
    func intersection1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let n1 = Set(nums1)
        let n2 = Set(nums2)
        
        var result = [Int]()
        for n in n1 {
            if n2.contains(n) {
                result.append(n)
            }
        }
        return result
    }
}

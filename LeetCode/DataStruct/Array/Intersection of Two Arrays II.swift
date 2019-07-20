//
//  Intersection of Two Arrays II.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class IntersectionofTwoArrays2 {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var dict = [Int:Int]()
        
        for value in nums1 {
            if let item = dict[value] {
                dict[value] = item + 1
            } else {
                dict[value] = 1
            }
        }
        
        var result = [Int]()
        for value in nums2 {
            if let item = dict[value], item > 0{
                result.append(value)
                dict[value] = item - 1
            }
        }
        
        return result
        
    }
}


//var startIndex = 0, endIndex = 0, flag = 0
//for i in 0..<nums1.count {
//    for j in 0..<nums2.count {
//        if nums1[i] == nums2[j] {
//            var k = i,z = j
//            while k < nums1.count &&  z < nums2.count && nums1[k] == nums2[z] {
//                k+=1
//                z+=1
//            }
//            if k > i && (k - i == z - j) {
//                startIndex = i
//                endIndex = k
//                flag = 1
//                break;
//            } else {
//                startIndex = 0
//                endIndex = 0
//                continue
//            }
//        }
//    }
//    if flag == 1 {
//        break;
//    }
//}
//
//if startIndex >= 0 && endIndex >= startIndex {
//    return Array(nums1[startIndex..<endIndex])
//}
//return []

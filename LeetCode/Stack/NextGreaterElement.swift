//
//  nextGreaterElement.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class NextGreaterElement {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var array = [Int]()
        
        for i in 0..<nums1.count {
            var flag = 0
            var index = -1
            for j in 0..<nums2.count {
                if nums1[i] == nums2[j] {
                        index = j
                        break
                }
            }
            
            if index >= 0 {
                for j in index..<nums2.count {
                    if nums2[j] > nums1[i] {
                        array.append(nums2[j])
                        flag = 1
                        break;
                    }
                }
            }
    
            if flag == 0 {
                array.append(-1)
            }
        }
        return array
    }
}

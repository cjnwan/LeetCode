//
//  PeakIndexinaMountainArray.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/16.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class PeakIndexinaMountainArray {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        for i in 1..<A.count-1 {
            if A[i-1] < A[i] && A[i] > A[i+1] {
                return i
            }
        }
        return -1
    }
}

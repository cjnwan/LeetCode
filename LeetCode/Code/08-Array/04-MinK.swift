//
//  04-MinK.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/9.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

// Top K

class MinK {
    
    // O nlogn(sorted or heap)
    func findMinK(_ nums:[Int], _ k:Int) -> [Int] {
        if nums.count <= k {
            return nums.sorted()
        }
        
        let sortedNums = nums.sorted()
        
        var res = [Int]()
        for i in 0..<k {
            res.append(sortedNums[i])
        }
        return res
    }
    
    // O n (BFPRT)
    func getKMins(_ nums:[Int], _ k:Int) -> [Int] {
        if k < 1 || k > nums.count {
            return nums
        }
        
        let kthMin = getKthMinByBFPRT(nums,k)
        var res = [Int]()
        
        for i in 0..<k {
            if nums[i] < kthMin {
                res.append(nums[i])
            }
        }
        
        while res.count < k {
            res.append(kthMin)
        }
        
        return res;
    }
    
    func getKthMinByBFPRT(_ nums:[Int], _ k:Int) -> Int {
        return select(nums, 0, nums.count-1, k-1)
    }
    
    func select(_ nums:[Int], _ begin:Int, _ end:Int, _ index:Int) -> Int {
        if begin == end {
            return nums[begin]
        }
        
        let pivot = medianOfMedians(nums,begin,end)
        let pivotRange = partition(nums, begin, end, pivot);
        
        if index >= pivotRange[0] && index <= pivotRange[1] {
            return nums[index]
        } else if (index < pivotRange[0]) {
            return select(nums, begin, pivotRange[0]-1, index)
        } else {
            return select(nums, pivotRange[1] + 1, end, index)
        }
    }
    
    func medianOfMedians(_ nums:[Int], _ begin:Int, _ end:Int) -> Int {
        let num  = end - begin + 1
        let offset = num % 5 == 0 ? 0 : 1
        var res = [Int](repeating: 0, count: num/5 + offset)
        
        for i in 0..<res.count {
            let b = begin + i * 5
            let e = b + 4
            if b != min(end, e) {
                res[i] = getMedian(nums,b,min(end, e))
            }
            
        }
        return select(res, 0, res.count-1, res.count/2)
    }
    
    func getMedian(_ nums:[Int], _ begin:Int, _ end:Int) -> Int {
        var nums = nums
        insertionSort(&nums, begin, end);
        let sum = begin + end;
        let mid = (sum / 2) + (sum % 2);
        return nums[mid];
    }
    
    func insertionSort(_ nums:inout [Int], _ begin:Int, _ end:Int) {
        var nums = nums
        for i in begin + 1 ... end {
            let get = nums[i];
            var j = i - 1;
            while j >= begin && nums[j] > get {
                nums[j + 1] = nums[j];
                j -=  1;
            }
            nums[j + 1] = get;
        }
    }
    
    func partition(_ nums:[Int], _ begin:Int, _ end:Int, _ pivot:Int)->[Int] {
        var nums = nums;
        var small = begin - 1;     // 小区最后一个元素下标
        var big = end + 1;         // 大区第一个元素下标
        var cur = begin;
        while cur < big {
            if (nums[cur] < pivot) {
                small += 1
                nums.swapAt(small, cur)
                cur += 1
            } else if (nums[cur] > pivot) {
                big -= 1
                nums.swapAt(big, cur)
            } else {
                cur += 1;
            }
        }
        return [small + 1,big - 1];
    }
}

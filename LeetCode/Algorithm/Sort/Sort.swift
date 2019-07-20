//
//  Sort.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/8.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class Sort<T:Comparable> {
    
    public func bubbleSort(_  array:[T]) ->[T] {
        var nums = array
        for i in 0..<nums.count {
            for j in 0..<nums.count - i - 1 {
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                }
            }
        }
        return nums
    }
    
    public func selectionSort(_ array:[T]) ->[T] {
        var nums = array
        for i in 0..<nums.count {
            var min = nums[i]
            var k = i
            for j in (i+1)..<nums.count {
                if nums[j] < min {
                    min = nums[j]
                    k = j
                }
            }
            if k != i {
                nums.swapAt(i, k)
            }
        }
        return nums
    }
    
    public func insertionSort(_ array:[T]) ->[T] {
        var nums = array
//        for i in 1..<nums.count {
//            for j in stride(from: i, to: 0, by: -1) {
//                if j>0 && nums[j] < nums[j-1] {
//                    nums.swapAt(j, j-1)
//                }
//            }
//        }
        
        for i in 1..<nums.count {
            let value = nums[i]
            var k = i
            for j in stride(from: i - 1, through: 0, by: -1) {
                if nums[j] > value {
                    nums[j+1] = nums[j]
                    k = k - 1
                } else {
                    break
                }
            }
            nums[k] = value
        }
        return nums
    }
    
    public func shellSort(_ array:[T]) ->[T] {
        var nums = array
        var gap = array.count/2
        
        while gap > 0 {
            for i in gap..<nums.count {
                let tmp = nums[i]
                var k = i-gap
                for j in stride(from: i-gap, through: 0, by: -gap) {
                    if nums[j] > tmp {
                        nums[j+gap] = nums[j]
                        k-=gap
                    }
                }
                nums[k+gap] = tmp
            }
            gap = gap/2
        }
        
        return nums
    }
    
    public func mergeSort(_ array:inout[T]) -> [T] {
        let number = array.count
        var temp = [T]()
        
        for t in array {
            temp.append(t)
        }
        _mergeSort(arr: &array, tmp: &temp, startIndex: 0, endIndex: number-1)
        return array
    }
    
    internal func _mergeSort(arr:inout[T], tmp:inout [T], startIndex:Int, endIndex:Int)  {
        if startIndex >= endIndex {
            return
        }
        
        let mid = startIndex + (endIndex - startIndex)/2
        _mergeSort(arr: &arr, tmp: &tmp, startIndex: startIndex, endIndex: mid)
        _mergeSort(arr: &arr, tmp: &tmp, startIndex: mid + 1, endIndex: endIndex)
        
        _merge(arr: &arr, tmp: &tmp, startIndex: startIndex, midIndex: mid, endIndex: endIndex)
    }
    
    internal func _merge(arr:inout[T], tmp:inout [T], startIndex:Int, midIndex:Int, endIndex:Int)  {
        for i in startIndex...endIndex {
            tmp[i] = arr[i]
        }
        
        var left = startIndex
        var right = midIndex + 1
        
        for i in startIndex...endIndex {
            if left > midIndex {
                arr[i] = tmp[right]
                right += 1
            } else if right > endIndex {
                arr[i] = tmp[left]
                left += 1
            } else if (tmp[right] < tmp[left]){
                arr[i] = tmp[right];
                right += 1
            } else {
                arr[i] = tmp[left]
                left += 1
            }
        }
    }
    
    public func quickSort(_ array:inout[T]) {
        _quickSort(&array, lo: 0, hi: array.count-1)
    }
    
    internal func _quickSort(_ array:inout[T], lo:Int, hi:Int) {
        if hi <= lo {
            return
        }
        
        let j = partition(&array, lo: lo, hi: hi)

//        let j = partition1(&array,  lo,  hi)
        
        _quickSort(&array, lo: lo, hi: j-1)
        _quickSort(&array, lo: j+1, hi: hi)
    }
    
    internal func partition(_ array:inout[T], lo:Int, hi:Int) -> Int {
        var i = lo, j = hi
        let pivot = array[lo]
        
        while true {
            while array[i] <= pivot {
                i+=1
                if i == hi {
                    break
                }
            }
            
            while pivot < array[j] {
                j-=1
                if j == lo {
                    break
                }
            }
            
            if i >= j {
                break
            }
            
            array.swapAt(i, j)
        }
        array.swapAt(lo, j)
        return j
    }
    

    
   
    
    func partition1(_ items: inout [T], _ start: Int, _ end: Int) -> Int {
        let val = items[end]
        var i = start
        for j in i..<end {
            if items[j] < val {
                // swap(i, j)
                let tmp = items[i]
                items[i] = items[j]
                items[j] = tmp
                i += 1
            }
        }
        // swap(i, end)
        items[end] = items[i]
        items[i] = val
        
        return i
    }
}

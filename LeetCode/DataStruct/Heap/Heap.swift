//
//  Heap.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/19.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class Heap<T:Comparable> {
    
    var nodes = [T]()
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public func buildHeap(array:[T]) {
        for i in stride(from: (nodes.count/2-1), to: 0, by: -1) {
            shiftDown(i, endIndex: nodes.count)
        }
    }
    
    
    public func insert(_ value:T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public func remove() -> T? {
        if nodes.isEmpty {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let max = nodes[0]
        nodes[0] = nodes.removeLast()
        shiftDown(0, endIndex: nodes.count)
        return max
    }
    
    public func remove(_ index:Int) -> T? {
        if nodes.isEmpty {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(index, endIndex: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    internal func shiftUp(_ index:Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(childIndex)
        
        while childIndex > 0 && child > nodes[parentIndex] {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    internal func shiftDown(_ startIndex:Int, endIndex:Int) {
        let leftChildIndex = self.leftChildIndex(startIndex)
        let rightChildIndex = leftChildIndex + 1
        
        var first = startIndex
        if leftChildIndex < endIndex && nodes[leftChildIndex] > nodes[first] {
            first = leftChildIndex
        }
        
        if rightChildIndex < endIndex && nodes[rightChildIndex] > nodes[first] {
            first = rightChildIndex
        }
        
        if first == startIndex {
            return
        }
        
        nodes.swapAt(startIndex, first)
        shiftDown(first, endIndex: endIndex)
    }
    
    internal func parentIndex(_ index:Int) -> Int {
        return (index - 1)/2
    }
    
    internal func leftChildIndex(_ index:Int) -> Int {
        return 2*index + 1
    }
    
    internal func rightChildIndex(_ index:Int) -> Int {
        return 2*index + 2
    }
    
}

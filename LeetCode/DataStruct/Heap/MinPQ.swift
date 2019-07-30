//
//  MinPQ.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class MinPQ<T:Comparable> {
    
    fileprivate var pq:[T?]
    fileprivate var n:Int
    
    convenience init() {
        self.init(1)
    }
    
    init(_ initCapacity:Int) {
        n = 0
        pq = [T](repeating: Optional<T>.none!, count: initCapacity + 1)
    }
    
    init(_ keys:[T]) {
        n = keys.count
        pq = [T](repeating: Optional<T>.none!, count: n + 1)
        
        for i in 0..<n {
            pq[i+1] = keys[i]
        }
        
        for i in stride(from: n/2, through: 1, by: -1) {
            sink(i)
        }
    }
    
    public func isEmpty()->Bool {
        return n == 0
    }
    
    public func size() ->Int {
        return n
    }
    
    public func min()->T {
        return pq[1]!
    }
    
    private func resize(_ capacity:Int) {
        var temp = [T?](repeating: Optional<T>.none!, count: capacity)
        for i in 1...n {
            temp[i] = pq[i]
        }
        pq = temp
    }
    
    public func insert(_ key:T) {
        if n == pq.count - 1 {
            resize(2*pq.count)
        }
        n+=1
        pq[n] = key
        swim(n)
    }
    
    public func delMin() -> T? {
        if isEmpty() {
            return nil
        }
        
        let min = pq[1]
        pq.swapAt(1, n)
        n -= 1
        sink(1)
        let index = n + 1
        pq[index] = nil
        if n > 0 && n == (pq.count - 1)/4 {
            resize(pq.count/2)
        }
        return min
    }
    
    private func swim(_ k:Int) {
        var k = k
        while k > 1 && greater(k/2, k)  {
            pq.swapAt(k, k/2)
            k = k/2
        }
    }
    
    private func sink(_ k:Int) {
        var k = k
        while k*2<n {
            var j = 2*k
            if j < n && greater(j, j+1) {
                j += 1
            }
            if !greater(k, j) {
                break
            }
            
            pq.swapAt(k, j)
            k = j
        }
    }
    
    
    private func greater(_ i:Int, _ j:Int)->Bool {
        return i>j
    }
    
}

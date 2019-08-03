//
//  IndexMinPQ.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/31.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class IndexMinPQ<T:Comparable> {
    
    fileprivate var n:Int
    fileprivate var maxN:Int
    fileprivate var pq:[Int]
    fileprivate var qp:[Int]
    fileprivate var keys:[T?]
    
    init(_ maxN:Int) {
        self.maxN = maxN
        n = 0
        keys = [T](repeating: Optional<T>.none!, count: maxN + 1)
        pq = [Int](repeating: 0, count: maxN + 1)
        qp = [Int](repeating: -1, count: maxN + 1)
    }
    
    public func isEmpty()->Bool {
        return n == 0
    }
    
    public func size() ->Int {
        return n
    }
    
    public func contains(_ i:Int)->Bool {
        return qp[i] != -1
    }

    public func insert(_ i:Int, _ key:T) {
        if i<=0 || i >= maxN {
            return
        }
        if contains(i) {
            return
        }
        n+=1
        qp[i] = n
        pq[n] = i
        keys[i] = key
        swim(n)
    }
    
    public func minIndex()->Int {
        return pq[1]
    }
    
    public func minKey()->T? {
        return keys[pq[1]]
    }
    
    public func delMin() -> Int {
        if isEmpty() {
            return -1
        }
        
        let min = pq[1]
        exch(1,n)
        n -= 1
        sink(1)
        qp[min] = -1
        keys[min] = nil
        pq[n+1] = -1
        return min
    }
    
    public func keyOf(_ i:Int)-> T? {
        if !contains(i) {
            return nil
        } else {
            return keys[i]
        }
    }
    
    public func changeKey(_ i:Int, _ key:T) {
        if !contains(i) {
            return
        }
        
        keys[i] = key
        swim(qp[i])
        sink(qp[i])
    }
    
    public func change(_ i:Int, _ key:T) {
       return changeKey(i, key)
    }
    
    public func decreaseKey(_ i:Int, _ key:T) {
        if i<=0 || i >= maxN {
            return
        }
        if !contains(i) {
            return
        }
        if keys[i]! < key {
            return
        }
        keys[i] = key;
        swim(qp[i]);
    }
    
    public func increaseKey(_ i:Int, _ key:T) {
        if i<=0 || i >= maxN {
            return
        }
        if !contains(i) {
            return
        }
        if keys[i]! > key {
            return
        }
        keys[i] = key;
        sink(qp[i]);
    }
    
    public func delete(_ i:Int) {
        if i<=0 || i >= maxN {
            return
        }
        if !contains(i) {
            return
        }
        let index = qp[i];
        exch(index, n);
        n = n - 1
        swim(index);
        sink(index);
        keys[i] = nil;
        qp[i] = -1;
    }
    
    private func exch(_ i:Int, _ j:Int) {
        let swap = pq[i];
        pq[i] = pq[j];
        pq[j] = swap;
        qp[pq[i]] = i;
        qp[pq[j]] = j
    }
    
    private func swim(_ k:Int) {
        var k = k
        while k > 1 && greater(k/2, k)  {
            exch(k, k/2)
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
            
            exch(k, j)
            k = j
        }
    }
    
    
    private func greater(_ i:Int, _ j:Int)->Bool {
        return keys[pq[i]]! > keys[pq[j]]!
    }
}

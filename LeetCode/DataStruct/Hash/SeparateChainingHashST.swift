//
//  SeparateChainingHashST.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/25.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class SeparateChainingHashST<Key:Hashable,Value> {
    typealias Linked = SequentialSearchST<Key,Value>
    private var N:Int
    private var M:Int
    
    private var st:[Linked]
    
    init(_ cap:Int) {
        self.M = cap
        self.N = 0
        self.st = [Linked](repeating: Linked(), count: cap)
    }
    
    private func hash(_ key:Key) -> Int {
        return (key.hashValue & 0x7fffffff)%M
    }
    
    public func size()->Int {
        return M
    }
    
    private func resize(_ count:Int) {
       let temp = SeparateChainingHashST<Key,Value>(count)
        for  i in 0..<M {
            for key in st[i].keys() {
                temp.put(key, st[i].get(key))
            }
        }
        self.M = temp.M
        self.N = temp.N
        self.st = temp.st
    }
    
    public func get(_ key:Key)->Value? {
        let i = hash(key)
        return st[i].get(key)
    }
    
    public func put(_ key:Key, _ value:Value?) {
        if value == nil {
            delete(key)
            return
        }
        if N > M*10 {
            resize(2*M)
        }
        
        let i = hash(key)
        
        if !st[i].contains(key) {
            N += 1
        }
        st[i].put(key, value)
    }
    
    public func delete(_ key:Key) {
        let i = hash(key)
        
        if st[i].contains(key) {
            N -= 1
        }
        st[i].delete(key)
        
        if M>4 && N <= 2*M {
            resize(M/2)
        }
    }
    
}

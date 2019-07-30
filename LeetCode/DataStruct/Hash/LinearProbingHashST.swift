//
//  LinearProbingHashST.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/25.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class LinearProbingHsahST<Key:Hashable,Value> {
    private var N:Int   // 键值对个数
    private var M = 16 // 线性探测表大小
    
    private var keys:[Key?]
    private var values:[Value?]
    
    init() {
        self.keys = [Key?](repeating: nil, count: M)
        self.values = [Value?](repeating: nil, count: M)
        self.N = 0
    }
    
    init(_ cap:Int) {
        self.keys = [Key?](repeating: nil, count: cap)
        self.values = [Value?](repeating: nil, count: cap)
        self.N = 0
        self.M = cap
    }
    
    private func hash(_ key:Key) -> Int {
        return (key.hashValue & 0x7fffffff)%M
    }
    
    private func resize(_ count:Int) {
        let st = LinearProbingHsahST<Key,Value>(count)
        for i in 0..<M {
            if keys[i] != nil {
                st.put(keys[i]!, value: values[i]!)
            }
        }
        keys = st.keys
        values = st.values
        M = st.M
        
    }
    
    public func put(_ key:Key, value:Value) {
        if N >= M/2 {
            resize(2*M)
        }
        
        var i = hash(key)
        
        while keys[i] != nil {
            if keys[i] == key {
                values[i] = value
                return
            }
            i = (i+1)%M
        }
        
        keys[i] = key
        values[i] = value
        N += 1
    }
    
    public func get(_ key:Key)->Value? {
        var i = hash(key)
        
        while keys[i] != nil {
            if keys[i] == key {
                return values[i]
            }
            i = (i+1)%M
        }
        return nil
    }
    
    public func delete(_ key:Key) {
        if !keys.contains(key) {
            return
        }
        
        var i = hash(key)
        while key != keys[i] {
            i = (i+1)%N
        }
        
        keys[i] = nil
        values[i] = nil
        
        i = (i+1)%N
        while keys[i] != nil {
            let keyToRedo = keys[i]
            let valToRedo = values[i]
            
            keys[i] = nil
            values[i] = nil
            
            N-=1
            
            put(keyToRedo!, value: valToRedo!)
            i = (i+1)%M
        }
        N-=1
        if N > 0 && N == M/8 {
            resize(M/2)
        }
    }
}

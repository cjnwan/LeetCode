//
//  SequentialSearchST.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/25.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

private class Node<Key:Hashable,Value> {
    public var key:Key
    public var value:Value
    public var next:Node?
    
    init(_ key:Key, _ value:Value, _ next:Node?) {
        self.key = key
        self.value = value
        self.next = next
    }
}

public class SequentialSearchST<Key:Hashable,Value> {
    fileprivate var head :Node<Key, Value>?
    var N:Int
    
    init() {
        self.head = nil
        self.N = 0
    }
    
    public func size()->Int {
        return N
    }
    
    public func isEmpty()->Bool {
        return size() == 0
    }
    
    public func contains(_ key:Key)->Bool {
        return get(key) != nil
    }
    
    public func get(_ key:Key)->Value? {
        var node = head
        while node != nil {
            if key == node!.key {
                return node!.value
            }
            node = node?.next
        }
        return nil
    }
    
    public func put(_ key:Key, _ value:Value?) {
        if value == nil {
            delete(key)
            return
        }
        
        var node = head
        while node != nil {
            if node?.key == key {
                node?.value = value!
                return
            }
            node = node?.next
        }
        
        head = Node<Key,Value>(key,value!,head)
        N+=1
    }
    
    public func delete(_ key:Key) {
        head = delete(head, key)
    }
    
    private func delete(_ node:Node<Key, Value>?,_ key:Key)->Node<Key, Value>? {
        if node == nil {
            return nil
        }
        if node?.key == key {
            N-=1
            return node?.next
        }
        node?.next = delete(node?.next, key)
        return node
    }
    
    public func keys() -> [Key] {
        var arr = [Key]()
        
        var node = head
        while node != nil {
            arr.append(node!.key)
            node = node?.next
        }
        return arr
    }
}


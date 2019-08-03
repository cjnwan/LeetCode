//
//  Trie.swift
//  Tire
//
//  Created by 陈剑南 on 2019/8/2.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

let R = 256

fileprivate class Node<T> {
    public var val:T?
    public var next = [Node<T>?](repeating: nil, count: R)
}

public class TrieST<T> {
    private var root = Node<T>()
    
    public func get(_ key:String) -> T? {
        let node = get(root,key,0)
        
        guard let x = node else {
            return nil
        }
        
        return x.val
    }
    
    private func get(_ x:Node<T>?,_ key:String, _ d:Int )->Node<T>? {
        if x == nil {
            return nil
        }
        
        if d == key.count {
            return x
        }
        
        let c = key[key.index(key.startIndex, offsetBy: d)]
        return get(x?.next[Int(c.asciiValue!)],key,d+1)
    }
    
    public func put(_ key:String, _ val:T) {
        root = put(root, key, val, 0)!
    }
    
    private func put(_ x:Node<T>?, _ key:String, _ val:T, _ d:Int)->Node<T>? {
        var x = x
        if x == nil {
            x = Node<T>()
        }
        if d == key.count {
            x?.val = val
            return x
        }
        
        let c = key[key.index(key.startIndex, offsetBy: d)]
        x?.next[Int(c.asciiValue!)] = put(x?.next[Int(c.asciiValue!)], key, val, d+1)
        
        return x
    }
}

extension TrieST {
    public func keys()->[String]? {
        return keysWithPrefix("")
    }
    
    public func keysWithPrefix(_ pre:String) -> [String]? {
        var queue = [String]()
        collect(get(root, pre, 0), pre, &queue)
        return queue
    }
    
    private func collect(_ x:Node<T>?, _ pre:String, _ queue: inout [String]) {
        if x == nil {
            return
        }
        if x?.val != nil {
            queue.append(pre)
        }
        
        for r in 0..<R {
            collect(x?.next[r], pre + "\(r)", &queue)
        }
    }
}

extension TrieST {
    public func keysThatMatch(_ pat:String) -> [String]? {
        var queue = [String]()
        collect(root,"",pat,&queue)
        return queue
    }
    
    private func collect(_ x:Node<T>?, _ pre:String, _ pat:String, _ queue: inout [String]) {
        if x == nil {
            return
        }
        
        let d = pat.count
        
        if d == pat.count && x?.val != nil {
            queue.append(pre)
        }
        if d == pat.count {
            return
        }
        
        let next = pat[pat.index(pat.startIndex, offsetBy: d)]
        
        for r in 0..<R {
            if next == "." || next.asciiValue! == r {
                collect(x?.next[r], pre + "\(r)", pat,&queue)
            }
        }
    }
}

extension TrieST {
    
    public func longestPrefixOf(_ s:String)->String {
        let length = search(root, s, 0, 0)
        let index = s.index(s.startIndex, offsetBy: length)
        return String(s[..<index])
        
    }
    
    private func search(_ x:Node<T>?, _ s:String, _ d:Int, _ length:Int)->Int {
        var length = length
        if x == nil {
            return length
        }
        
        if x?.val != nil {
            length = d
        }
        
        if d == s.count {
            return length
        }
        
        let c = s[s.index(s.startIndex, offsetBy: d)]
        return search(x?.next[Int(c.asciiValue!)], s, d+1, length)
    }
}

extension TrieST {
    public func delete(_ key:String) {
       root = delete(root, key, 0)!
    }
    
    private func delete(_ x:Node<T>?, _ key:String, _ d:Int)->Node<T>? {
        if x == nil {
            return nil
        }
        
        if d == key.count {
            x?.val = nil
        } else {
            let c = key[key.index(key.startIndex, offsetBy: d)]
            x?.next[Int(c.asciiValue!)] = delete(x?.next[Int(c.asciiValue!)], key, d+1)
        }
        
        if x?.val != nil {
            return x
        }
        
        for r in 0..<R {
            if x?.next[r] != nil {
                return x
            }
        }
        
        return nil
    }
}

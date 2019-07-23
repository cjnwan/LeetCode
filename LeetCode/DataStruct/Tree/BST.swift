//
//  BST.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/23.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Nodee<T:Comparable> {
    
    public var key:T
    
    public var left:Nodee?
    
    public var right:Nodee?
    
    public var N:Int
    
    init(_ key:T, _ N:Int) {
        self.key = key
        self.N = N
    }
}

class BST<T:Comparable> {
    
    public typealias Node = Nodee<T>
    
    private var root:Node?
    
    public func size() -> Int {
        return size(root)
    }
    
    private func size(_ x:Node?) -> Int {
        guard let node = x else {
            return 0
        }
        return node.N
    }
    
    public func get(_ key:T) -> Node? {
        return get(root, key)
    }
    
    private func get(_ node:Node?, _ key:T) -> Node? {
        guard let node = node else {
            return nil
        }
        
        if node.key > key {
            return get(node.left, key)
        } else if node.key < key {
            return get(node.right, key)
        } else {
            return node
        }
    }
    
    public func put(_ key:T)-> Node? {
        root = put(root, key: key)
        return root
    }
    
    private func put(_ node:Node?,key:T) -> Node? {
        guard let node = node else {
            return Nodee(key,1)
        }
        if node.key < key {
            node.right = put(node.right, key: key)
        } else if node.key > key {
            node.left = put(node.left, key: key)
        }else {
            node.key = key
        }
        node.N = size(node.left) + size(node.right) + 1
        return node
    }
    
    public func min() -> Node? {
        return min(root)
    }
    
    private func min(_ node:Node?) ->Node? {
        guard let n = node?.left else {
            return node
        }
        return min(n.left)
    }
    
    public func floor(_ key:T) -> T? {
        let node = floor(root, key)
        if node == nil {
            return nil
        }
        return node?.key
    }
    
    private func floor(_ node:Node?,_ key:T) -> Node? {
        guard let node = node else {
            return nil
        }
        if key == node.key {
            return node
        } else if key < node.key {
            return floor(node.left, key)
        }
        let t = floor(node.right, key)
        if t != nil {
            return t
        } else {
            return node
        }
    }
    
    public func select(_ k:Int) ->T? {
        return select(root, k)?.key
    }
    
    public func select(_ node:Node?, _ k:Int) ->Node? {
        guard let node = node else {
            return nil
        }
        let t = size(node.left)
        
        if t > k {
            return select(node.left, k)
        } else if t < k {
            return select(node.right, k-t-1)
        } else {
            return node
        }
    }
    
    public func rank(_ key:T) -> Int {
        return rank(root, key)
    }
    
    private func rank(_ node:Node?, _ key:T) -> Int {
        guard let node = node else {
            return 0
        }
        if key < node.key {
            return rank(node.left, key)
        } else if key > node.key {
            return 1 + size(node.left) + rank(node.right, key)
        } else {
            return size(node.left)
        }
    }
    
    public func deleteMin() {
        root = deleteMin(root)
    }
    
    private func deleteMin(_ node:Node?) -> Node? {
        if node?.left == nil {
            return node?.right
        }
        node?.left = deleteMin(node?.left)
        node?.N = size(node?.left) + size(node?.right) + 1
        
        return node
    }
    
    public func delete(_ key:T) {
        
    }
    
    private func delete(_ node:Node?, _ key:T) -> Node? {
        guard var node = node else {
            return nil
        }
        if key > node.key {
            node.right = delete(node.right, key)
        } else if key < node.key {
            node.left = delete(node.left, key)
        } else {
            if node.right == nil {
                return node.left
            }
            if node.left == nil {
                return node.right
            }
            let t = node
            node = min(t.right)!
            node.right = deleteMin(t.right)
            node.left = t.left
        }
        node.N = size(node.left) + size(node.right) + 1
        return node
    }

}

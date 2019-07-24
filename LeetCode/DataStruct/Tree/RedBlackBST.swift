//
//  RedBlackBST.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/24.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RBNode<T:Comparable> {
    
    public var key:T
    
    public var left:RBNode?
    
    public var right:RBNode?
    
    public var N:Int
    
    public var color:Bool // true 红节点
    
    init(_ key:T, _ N:Int, _ color:Bool) {
        self.key = key
        self.N = N
        self.color = color
    }
    
    public func isRed(_ node:RBNode?) -> Bool {
        guard let node = node else {
            return false
        }
        return node.color
    }
}

class BlackRedBST<T:Comparable> {
    public typealias Node = RBNode<T>
    
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
    
    public func put(_ key:T) {
        root = put(root,key)
        root?.color = false
    }
    
    private func put(_ node:Node?, _ key:T) -> Node? {
        if node == nil {
            return Node(key,1,true)
        }
        
        var node = node!
        
        if key > node.key {
            node.right = put(node.right, key)
        } else if key < node.key {
            node.left = put(node.left, key)
        } else {
            node.key = key
        }
        
        if node.right?.color == true && node.left?.color == false {
            node = rotateLeft(node)
        }
        if node.left?.color == true && node.left?.left?.color  == true {
            node = rotateRight(node)
        }
        if node.left?.color == true && node.right?.color == true {
            flipColors(node)
        }
        node.N = size(node.left) + size(node.right) + 1
        return node
    }
    
    private func flipColors(_ node:Node) {
        node.color = true
        node.left?.color = false
        node.right?.color = false
    }
    
    private func rotateLeft(_ node:Node)->Node {
        let x = node.right!
        node.right = x.left
        x.left = node
        x.color = node.color
        x.N = node.N
        node.N = size(node.left) + size(node.right) + 1
        return x
    }
    
    private func rotateRight(_ node:Node)->Node {
        let x = node.left!
        node.left = x.right
        x.right = node
        x.color = node.color
        x.N = node.N
        node.N = size(node.left) + size(node.right) + 1
        return x
    }
}

//
//  AVLTree.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/19.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class TreeNode<T:Comparable> {
    var key:T
    var left:TreeNode?
    var right:TreeNode?
    var height:Int
    
    public init(_ key:T) {
        self.key = key
        self.left = nil
        self.right = nil
        self.height = 1
    }
}

public class AVLTree<T:Comparable> {
    public typealias Node = TreeNode<T>
    
    var root:Node?
    
    public init(){}
    
    public func height(node:Node?) -> Int {
        guard let node = node else {
            return 0
        }
        return node.height
    }
    
    internal func rightRotate(node:Node?) ->Node? {
        let left = node?.left
        let leftright = left?.right
        
        left?.right = node
        node?.left = leftright
        
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
        left?.height = max(height(node: left?.left), height(node: left?.right)) + 1
        
        return left
    }
    
    internal func leftRotate(node:Node?) -> Node? {
        let right = node?.right
        let rightleft = right?.left
        
        right?.left = node
        node?.right = rightleft
        
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
        right?.height = max(height(node: right?.left), height(node: right?.right)) + 1
        
        return right
    }
    
    internal func getBalance(node:Node?) -> Int {
        guard let node = node else {
            return 0
        }
        return height(node: node.left) - height(node: node.right)
    }
    
    public func insert(key:T) {
        root = insert(key: key, node: root)
    }
    
    public func insert(key:T,node:Node?) -> Node? {
        if node == nil {
            return TreeNode(key)
        }
        
        if key < node!.key {
            node?.left = insert(key: key,node: node?.left)
        } else {
            node?.right = insert(key: key,node: node?.right)
        }
        
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
        
        let balance = getBalance(node: node)
        
        // Left Left Case
        if balance > 1 && key < (node?.left!.key)! {
            return rightRotate(node: node)
        }
        
        // Right Right Case
        if (balance < -1 && key > (node?.right!.key)!) {
            return leftRotate(node: node);
        }
        
        // Left Right Case
        if (balance > 1 && key > (node?.left!.key)!) {
            node?.left =  leftRotate(node: node?.left);
            return rightRotate(node: node);
        }
        
        // Right Left Case
        if (balance < -1 && key < (node?.right!.key)!) {
            node?.right = rightRotate(node: node?.right);
            return leftRotate(node:node);
        }
        
        return node
    }
    
    public func preOrder() {
        preOder(node: root)
    }
    
    internal func preOder(node:Node?) {
        if node != nil {
            print(node?.key ?? "")
            preOder(node: node?.left)
            preOder(node: node?.right)
        }
    }
    
    public func inOrder() {
        inOder(node: root)
    }
    
    internal func inOder(node:Node?) {
        if node != nil {
            preOder(node: node?.left)
            print(node?.key ?? "")
            preOder(node: node?.right)
        }
    }
    
    public func postOrder() {
        postOder(node: root)
    }
    
    internal func postOder(node:Node?) {
        if node != nil {
            preOder(node: node?.left)
            preOder(node: node?.right)
            print(node?.key ?? "")
        }
    }
}


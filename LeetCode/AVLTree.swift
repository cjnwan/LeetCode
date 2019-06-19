//
//  AVLTree.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/6.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class TreeNode<T:Comparable> {
    var key:T
    var height:Int
    var left:TreeNode?
    var right:TreeNode?
    weak var parent:TreeNode?
    
    init(key:T,left:TreeNode?,right:TreeNode?) {
        self.key = key
        self.left = left
        self.right = right
        self.height = 0
    }
}

public class AVLTree<T:Comparable> {
    var root:TreeNode<T>?
    
    init() {
        root = nil
    }
    
    public func height(node:TreeNode<T>?) -> Int {
        if let n = node {
            return n.height
        }
        return 0
    }
    
    public func search(tree: TreeNode<T>?,key:T) -> TreeNode<T>? {
        guard let node = tree else {
            return nil
        }
        
        if key == node.key {
            return node
        } else if key > node.key {
            return search(tree: node.right, key: key)
        } else {
            return search(tree: node.left, key: key)
        }
    }
    
    
    
}

extension AVLTree {
    
    public func insert(node:TreeNode<T>,key:T) {
        if key < node.key {
            if let left = node.left {
                insert(node: left, key: key)
            } else {
                let child = TreeNode(key: key, left: nil, right: nil)
                node.left = child
                balance(node: child)
            }
        } else if key != node.key {
            if let right = node.right {
                insert(node: right, key: key)
            } else {
                let child = TreeNode(key: key, left: nil, right: nil)
                node.right = child
                balance(node: child)
            }
        }
    }
    
    private func updateHeightUpwards(node:TreeNode<T>?) {
        if let node = node {
            let leftHeight = node.left?.height ?? 0
            let rightHeight = node.right?.height ?? 0
            node.height = max(leftHeight, rightHeight) + 1
            updateHeightUpwards(node: node.parent)
        }
    }
    
    fileprivate func lrDifference(node: TreeNode<T>?) -> Int {
        let lHeight = node?.left?.height ?? 0
        let rHeight = node?.right?.height ?? 0
        return lHeight - rHeight
    }
    
    public func balance(node:TreeNode<T>?) {
        guard let node = node else {
            return
        }
        
        updateHeightUpwards(node: node.left)
        updateHeightUpwards(node: node.right)
        
        let lrFactor = lrDifference(node: node)
        if lrFactor > 1 {
            if lrDifference(node: node.left) > 0 {
                
            } else {
               
            }
        } else {
            
        }
        
        
    }
    
    
}

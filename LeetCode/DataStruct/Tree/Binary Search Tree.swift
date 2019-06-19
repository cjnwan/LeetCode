//
//  Binary Search Tree.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/4.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class BinarySearch<T:Comparable> {
    var value:T
    var parent: BinarySearch?
    var left: BinarySearch?
    var right: BinarySearch?
    
    public init(value:T) {
        self.value = value
    }
    
    public var isRoot:Bool {
        return parent == nil
    }
    
    public var isLeaf:Bool {
        return self.left == nil && self.right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    
    
    
    
    
}

extension BinarySearch {
    public func insert(value:T) {
        if value < self.value {
            if let left = self.left {
                left.insert(value: value)
            } else {
                left = BinarySearch(value: value)
                left?.parent = self
            }
        } else {
            if let right = self.right {
                right.insert(value: value)
            } else {
                right = BinarySearch(value: value)
                right?.parent = self
            }
        }
    }
}

extension BinarySearch {
    public func remove() -> BinarySearch? {
        let replacement:BinarySearch?
        
        if let right = right {
            replacement = right.maxmum()
        } else if let left = left {
            replacement = left.minimum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnentParentTo(node: replacement)
        
        parent = nil
        left = nil
        right = nil
        
        return replacement
        
    }
    
    public func minimum() -> BinarySearch? {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maxmum() -> BinarySearch? {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    public func reconnentParentTo(node:BinarySearch?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
}

extension BinarySearch {
    public func search(value:T) -> BinarySearch? {
        if value < self.value {
            return self.left?.search(value: value)
        } else if value > self.value {
            return self.right?.search(value: value)
        } else {
            return self
        }
    }
    
    public func search1(value:T) -> BinarySearch? {
        var node:BinarySearch? = self
        
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
}

extension BinarySearch {
    public func traverseInOrder(process:(T)->Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process:(T)->Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process:(T)->Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
}

extension BinarySearch {
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
}

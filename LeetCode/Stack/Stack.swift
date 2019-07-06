//
//  Stack.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/3.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

// 最小栈
class MinStack {
    
    var array = [Int]()
    var min = [Int]()
    
    func push(_ x: Int) {
        array.append(x)
        if min.isEmpty || min.last! >= x {
            min.append(x)
        }
    }
    
    func pop() {
        if self.top() == min.last {
            min.removeLast()
        }
        array.removeLast()
    }
    
    func top() -> Int {
        return array.last ?? 0
    }
    
    func getMin() -> Int {
        return min.last!
    }
}

// 用栈实现队列

class MyQueue {
    
    var a = [Int]()
    var b = [Int]()
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
       a.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if b.isEmpty {
            while !a.isEmpty {
                b.append(a.removeLast())
            }
        }
        return b.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if b.isEmpty {
            while !a.isEmpty {
                b.append(a.removeLast())
            }
        }
        return b.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return a.isEmpty && b.isEmpty
    }
}


public class Stack<T:Comparable> {
    var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public func push(_ element: T) {
        array.append(element)
    }
    
    public func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
    
    public var count: Int {
        return array.count
    }
}

//
//  Edge.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class GListNode<T:Comparable> {
    public var val: T
    public var next: GListNode?
    public init(_ val: T) {
        self.val = val
        self.next = nil
    }
}

public class GLinkedList<T:Comparable> {
    var head:GListNode<T>? = nil
    
    public var tail:GListNode<T>? {
        var node = head
        while let next  = node?.next {
            node = next
        }
        return node
    }
    
    public func Iterable() ->[T] {
        var result = [T]()
        var node = head;
        while node != nil {
            result.append(node!.val)
            node = node!.next
        }
        return result
    }
    
    public func add(_ val:T) {
        let node  = GListNode(val)
        add(node)
    }
    
    private func add(_ node:GListNode<T>?) {
        if let last = tail {
            last.next = node
        } else {
            head = node
        }
    }
}

public class Edge:Comparable {
    fileprivate var v:Int   // 顶点之一
    fileprivate var w:Int   // 另一个顶点
    fileprivate var weight:Double   // 边的权重
    
    init(_ v:Int, _ w:Int, _ weight:Double) {
        self.v = v
        self.w = w
        self.weight = weight
    }
    
    public func other(_ vertex:Int) -> Int {
        if vertex == v {
            return w
        } else if vertex == w {
            return v
        }
        return 0
    }
    
    public func either()->Int {
        return v
    }
    
    static public func == (_ this:Edge, _ that:Edge)->Bool {
        return this.weight == that.weight
    }
    
    static public func < (_ this:Edge, _ that:Edge)->Bool {
        return this.weight < that.weight
    }
    
    static public func > (_ this:Edge, _ that:Edge)->Bool {
        return this.weight > that.weight
    }
}

public class EdgeWeightGraph {
    public var V:Int   // 顶点个数
    public var E:Int   // 边的个数
    public var adj:[GLinkedList<Edge>]    //邻接表
    
    init(_ V:Int) {
        self.V = V
        self.E = 0
        self.adj = [GLinkedList<Edge>](repeating: GLinkedList<Edge>(), count: V)
        
        for v in 0..<V {
            adj[v] = GLinkedList<Edge>()
        }
    }

    
    public func addEdge(_ e:Edge) {
        let v = e.either()
        let w = e.other(v)
        adj[v].add(e)
        adj[w].add(e)
        E+=1
    }
    
}

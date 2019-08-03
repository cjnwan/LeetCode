//
//  EdgeWeightDigraph.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/31.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class DirectedEdge:Comparable {
    fileprivate var v:Int   // 顶点之一
    fileprivate var w:Int   // 另一个顶点
    fileprivate var weight:Double   // 边的权重
    
    init() {
        self.v = 0
        self.w = 0
        self.weight = 0
    }
    
    init(_ v:Int, _ w:Int, _ weight:Double) {
        self.v = v
        self.w = w
        self.weight = weight
    }
    
    public func weigh() ->Double {
        return weight
    }
    
    public func from() -> Int {
        return v;
    }
    
    public func to()->Int {
        return w
    }
    
    static public func == (_ this:DirectedEdge, _ that:DirectedEdge)->Bool {
        return this.weight == that.weight
    }
    
    static public func < (_ this:DirectedEdge, _ that:DirectedEdge)->Bool {
        return this.weight < that.weight
    }
    
    static public func > (_ this:DirectedEdge, _ that:DirectedEdge)->Bool {
        return this.weight > that.weight
    }
}

public class EdgeWeightDigraph {
    public var V:Int   // 顶点个数
    public var E:Int   // 边的个数
    public var adj:[GLinkedList<DirectedEdge>]    //邻接表
    
    init(_ V:Int) {
        self.V = V
        self.E = 0
        self.adj = [GLinkedList<DirectedEdge>](repeating: GLinkedList<DirectedEdge>(), count: V)
        
        for v in 0..<V {
            adj[v] = GLinkedList<DirectedEdge>()
        }
    }
    
    
    public func addEdge(_ e:DirectedEdge) {
        adj[e.from()].add(e)
        E+=1
    }
    
}

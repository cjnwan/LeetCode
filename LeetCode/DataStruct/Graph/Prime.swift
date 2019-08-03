//
//  Prime.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class LazyPrimeMST {
    fileprivate var marked:[Bool]   // 最小生成树的顶点
    fileprivate var mst:[Edge]  // 最小生成树的边
    fileprivate var pq:MinPQ<Edge>  // 横切边
    
    init(_ G:EdgeWeightGraph) {
        pq = MinPQ<Edge>()
        marked = [Bool](repeating: false, count: G.V)
        mst = [Edge]()
        
        visited(G, 0)
        
        while !pq.isEmpty() {
            let e = pq.delMin() // 从pq中得到权重最小的边
            let v = e!.either()
            let w = e!.other(v)
            if marked[v] && marked[w] {
                continue
            }
            mst.append(e!)
            if !marked[v] {
                visited(G, v)
            }
            if !marked[w] {
                visited(G, w)
            }
        }
    }
    
    private func visited(_ G:EdgeWeightGraph, _ v:Int) {
        marked[v] = true
        for e in G.adj[v].Iterable() {
            if !marked[e.other(v)] {
                pq.insert(e)
            }
        }
    }
    
    public func edges()->[Edge] {
        return mst
    }
}

class PrimeMST {
    fileprivate var marked:[Bool]   // 最小生成树的顶点
    fileprivate var distTo:[Double] // distTo[w]=edgeTo[w].weight()
    fileprivate var edgeTo:[Edge]  // 最小生成树的边
    fileprivate var pq:IndexMinPQ<Double>  // 横切边
    
    init(_ G:EdgeWeightGraph) {
        pq = IndexMinPQ<Double>(G.V)
        marked = [Bool](repeating: false, count: G.V)
        distTo = [Double](repeating: Double.greatestFiniteMagnitude, count: G.V)
        edgeTo = [Edge](repeating: Edge(), count: G.V)
        
        distTo[0] = 0
        pq.insert(0, 0) // 用顶点0和权重0初始化pq
        while !pq.isEmpty() {
            
        }
    }
    
    private func visit(_ G:EdgeWeightGraph, v:Int) {
        marked[v] = true
        
        for e in G.adj[v].Iterable() {
            let w = e.other(v)
            if marked[w] {
                continue
            }
            if e.weigh() < distTo[w] {
                edgeTo[w] = e
                distTo[w] = e.weigh()
                if pq.contains(w) {
                    pq.change(w, distTo[w])
                } else {
                    pq.insert(w, distTo[w])
                }
            }
        }
    }
}

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

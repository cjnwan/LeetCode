//
//  Dijkstra.swift
//  
//
//  Created by 陈剑南 on 2019/7/31.
//

import Foundation

public class DijkstraSP {
    fileprivate var edgeTo:[DirectedEdge]
    fileprivate var distTo:[Double]
    fileprivate var pq:IndexMinPQ<Double>
    
    init(_ G:EdgeWeightDigraph,_ s:Int) {
        edgeTo = [DirectedEdge](repeating: DirectedEdge(), count: G.V)
        distTo = [Double](repeating: Double.greatestFiniteMagnitude, count: G.V)
        pq = IndexMinPQ<Double>(G.V)
        
        distTo[s] = 0
        pq.insert(0, 0)
        while !pq.isEmpty() {
            
        }
    }
    
    private func relax(_ G:EdgeWeightDigraph, _ v:Int) {
        for e in G.adj[v].Iterable() {
            let w = e.to()
            if distTo[w] > distTo[v] + e.weigh() {
                distTo[w] = distTo[v] + e.weigh()
                edgeTo[w] = e
                if pq.contains(w) {
                    pq.change(w, distTo[w])
                } else {
                    pq.insert(w, distTo[w])
                }
            }
        }
    }
}

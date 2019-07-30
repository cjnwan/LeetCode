//
//  Digraph.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class Digraph {
    fileprivate var V:Int
    fileprivate var E:Int
    fileprivate var adj:[LinkedList]
    
    init(_ V:Int) {
        self.V = V
        self.E = 0
        adj = [LinkedList](repeating: LinkedList(), count: V)
        for v in 0..<V {
            adj[v] = LinkedList();
        }
    }
    
    public func addEdge(_ v:Int, _ w:Int) {
        adj[v].add(w)
    }
    
    public func reverse()->Digraph {
        let d = Digraph(V)
        for v in 0..<V {
            for w in adj[v].Iterable() {
                d.addEdge(w, v)
            }
        }
        return d
    }
}

public class DirectedDFS {
    fileprivate var marked:[Bool]
    
    init(_ G:Digraph, _ s:Int) {
        marked = [Bool](repeating: false, count: G.V)
        dfs(G, s)
    }
    
    init(_ G:Digraph, _ source:[Int]) {
        marked = [Bool](repeating: false, count: G.V)
        for s in source {
            if !marked[s] {
                dfs(G, s)
            }
        }
    }
    
    private func dfs(_ G:Digraph, _ v:Int) {
        marked[v] = true
        for w in G.adj[v].Iterable() {
            if !marked[w] {
                dfs(G, w)
            }
        }
    }
    
    public func marked(_ v:Int) -> Bool {
        return marked[v]
    }
}

public class DirectedCycle {
    fileprivate var marked:[Bool]
    fileprivate var edge:[Int]
    fileprivate var stackCycle:[Int]? // 有向环中所有顶点
    fileprivate var onStack:[Bool] // 递归调用栈上的所有顶点
    
    init(_ G:Digraph) {
        onStack = [Bool](repeating: false, count: G.V)
        edge = [Int](repeating: 0, count: G.V)
        marked = [Bool](repeating: false, count: G.V)
        
        for v in 0..<G.V {
            if !marked[v] {
                dfs(G, v)
            }
        }
    }
    
    private func dfs(_ G:Digraph, _ v:Int) {
        onStack[v] = true
        marked[v] = true
        
        for w in G.adj[v].Iterable() {
            if hasCycle() {
                return
            } else if !marked[w] {
                edge[w] = v
                dfs(G, w)
            } else if (onStack[w]) {
                stackCycle = [Int]()
                var x = v
                while x != w {
                    stackCycle?.insert(x, at: 0)
                    x = edge[x]
                }
                stackCycle?.insert(w, at: 0)
                stackCycle?.insert(v, at: 0)
            }
           onStack[v] = false
        }
        
    }
    
    public func hasCycle()->Bool {
        return stackCycle == nil
    }
}

public class DepthFirstOrder {
    fileprivate var marked:[Bool]
    fileprivate var pre:[Int]
    fileprivate var post:[Int]
    fileprivate var reversePost:[Int]
    
    init(_ G:Digraph) {
        marked = [Bool](repeating: false, count: G.V)
        pre = [Int]()
        post = [Int]()
        reversePost = [Int]()
        
        for v in 0..<G.V {
            if !marked[v] {
                dfs(G, v)
            }
        }
    }
    
    private func dfs(_ G:Digraph, _ v:Int) {
        pre.append(v)
        marked[v] = true
        for w in G.adj[v].Iterable() {
            if !marked[w] {
                dfs(G, w)
            }
        }
        post.append(v)
        reversePost.insert(v, at: 0)
    }
}

public class Topological {
    fileprivate var order:[Int]?
    
    init(_ G:Digraph) {
        let cycle = DirectedCycle(G)
        if !cycle.hasCycle() {
            let dfs = DepthFirstOrder(G)
            order = dfs.reversePost
        }
    }
    
    public func isDAG()->Bool {
        return order != nil
    }
}

public class Kosaraju {
    fileprivate var marked:[Bool]
    fileprivate var id:[Int]
    fileprivate var count:Int
    
    init(_ G:Digraph) {
        marked = [Bool](repeating: false, count: G.V)
        id  = [Int](repeating: 0, count: G.V)
        count = 0
        let depth = DepthFirstOrder(G)
        for s in depth.reversePost {
            if !marked[s] {
                dfs(G, s)
                count += 1
            }
        }
    }
    
    private func dfs(_ G:Digraph, _ v:Int) {
        
        marked[v] = true
        id[v] = count
        for w in G.adj[v].Iterable() {
            if !marked[w] {
                dfs(G, w)
            }
        }
    }
    
    public func strongify(_ v:Int, _ w:Int)->Bool {
        return id[w] == id[v]
    }
    
    public func id(_ v:Int)->Int {
        return id[v]
    }
    
}

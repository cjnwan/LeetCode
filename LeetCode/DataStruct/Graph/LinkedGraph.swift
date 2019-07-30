//
//  LinkedGraph.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/29.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class LinkedGraph {
    
    fileprivate var V:Int   // 顶点个数
    fileprivate var E:Int   // 边的个数
    fileprivate var adj:[LinkedList]    //邻接表
    
    init(_ V:Int) {
        self.V = V
        self.E = 0
        self.adj = [LinkedList](repeating: LinkedList(), count: V)
        
        for v in 0..<V {
            adj[v] = LinkedList()
        }
    }
    
    public func VCount() ->Int {
        return V
    }
    
    public func ECount() ->Int {
        return E
    }
    
    public func addEdge(_ v:Int, _ w:Int) {
        adj[v].add(w)   // 将 w 添加到 v 的链表中
        adj[w].add(v)   // 将 v 添加到 w 的链表中
    }
}

public class DepthFirstSearch {
    fileprivate var marked:[Bool]
    fileprivate var number:Int
    fileprivate var edgeTo:[Int]    // 从起点到已知路径上的最后一个顶点
    fileprivate var s:Int           // 起点
    
    init(_ G:LinkedGraph, _ s:Int) {
        marked = [Bool](repeating: false, count: G.VCount())
        edgeTo   = [Int](repeating: 0, count: G.VCount())
        number = 0
        self.s = s
        dfs(G, s)
    }
    
    private func dfs(_ G:LinkedGraph, _ v:Int) {
        marked[v] = true
        number += 1
        for w in G.adj[v].Iterable() {
            if !marked[w] {
                edgeTo[w] = v
                dfs(G, w)
            }
        }
    }
    public func hasPathTo(_ v:Int) -> Bool {
        return marked[v]
    }
    
    public func pathTo(_ v:Int) ->[Int]? {
        if !hasPathTo(v) {
            return nil
        }
        
        var stack = [Int]()
        var x = v
        while x != s {
            stack.insert(x, at: 0)
            x = edgeTo[x]
        }
        stack.insert(0, at: s)
        return stack
    }
    
    public func marked(_ w:Int) -> Bool {
        return marked[w]
    }
    
    public func count()->Int {
        return number
    }
}

public class DreadFirstSearch {
    fileprivate var marked:[Bool]
    fileprivate var edgeTo:[Int]    // 从起点到已知路径上的最后一个顶点
    fileprivate var s:Int           // 起点
    
    init(_ G:LinkedGraph, _ s:Int) {
        marked = [Bool](repeating: false, count: G.VCount())
        edgeTo   = [Int](repeating: 0, count: G.VCount())
        self.s = s
        bfs(G, s)
    }
    
    private func bfs(_ G:LinkedGraph, _ v:Int) {
        var queue = [Int]()
        marked[v] = true
        queue.append(s)
        while queue.count > 0 {
            let v = queue.removeFirst()
            for w in G.adj[v].Iterable() {
                if !marked[w] {
                    edgeTo[w] = v
                    marked[w] = true
                    queue.append(w)
                }
            }
        }
    }
    public func hasPathTo(_ v:Int) -> Bool {
        return marked[v]
    }
    
    public func pathTo(_ v:Int) ->[Int]? {
        if !hasPathTo(v) {
            return nil
        }
        
        var stack = [Int]()
        var x = v
        while x != s {
            stack.insert(x, at: 0)
            x = edgeTo[x]
        }
        stack.insert(0, at: s)
        return stack
    }
    
    public func marked(_ w:Int) -> Bool {
        return marked[w]
    }
}

public class CC {
    fileprivate var marked:[Bool]
    fileprivate var id:[Int]
    fileprivate var count:Int
    
    init(_ G:LinkedGraph) {
        marked = [Bool](repeating: false, count: G.VCount())
        id = [Int](repeating: -1, count: G.VCount())
        count = 0
        for s in 0..<G.VCount() {
            if !marked[s] {
                dfs(G,s)
                count += 1
            }
        }
    }
    
    private func dfs(_ G:LinkedGraph, _ v:Int) {
        marked[v] = true
        id[v] = count
        for w in G.adj[v].Iterable() {
            if !marked[w] {
                dfs(G, w)
            }
        }
    }
    
    public func connected(_ v:Int, _ w:Int) -> Bool {
        return id[v] == id[w]
    }
    
    public func id(_ v:Int) -> Int {
        return id[v]
    }
}

public class Cycle {
    fileprivate var marked:[Bool]
    fileprivate var hasCycle:Bool
    
    init(_ G:LinkedGraph) {
        marked = [Bool](repeating: false, count: G.VCount())
        hasCycle = false
        for s in 0..<G.VCount() {
            if !marked[s] {
                dfs(G,s,s)
            }
        }
    }
    
    private func dfs(_ G:LinkedGraph, _ v:Int, _ u:Int) {
        marked[v] = true
        for w in G.adj[v].Iterable() {
            if !marked[w] {
                dfs(G, w, v)
            } else if w != u {
                hasCycle = true
            }
        }
    }
    
    public func isCycle() ->Bool {
        return hasCycle
    }
}

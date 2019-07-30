//
//  Graph.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/22.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class Vertex<T:Comparable> {
    var key:T
    var visited:Bool
    var weight:Int
    
    public init(_ key:T) {
        self.key = key
        self.visited = false
        self.weight = 0
    }
}

public class Graph<T:Comparable> {
    // 顶点个数
    var nVertexs:Int
    
    // 边的关系
    var adj:[[Int]]
    
    // 顶点
    var vertexs = [Vertex<T>]()
    
    public init(_ v: Int) {
        self.nVertexs = v
        self.adj = [[Int]](repeating: [Int](repeating: Int.max, count: v), count: v)
    }
    
    public func addVertex(_ key:T) {
        vertexs.append(Vertex(key))
    }
    
    public func addEdge(start:Int, end:Int) {
        addEdge(start: start, end: end, weight: 1);
    }
    
    public func addEdge(start:Int, end:Int, weight:Int) {
        adj[start][end] = weight
        adj[end][start] = weight
    }
    
    // 🈶向
    public func addEdgeForward(start:Int, end:Int, weight:Int) {
        adj[start][end] = weight
    }
    
    public func printMatrix() {
        for  i in 0..<nVertexs {
            for j in 0..<nVertexs {
                print(adj[i][j], terminator: "")
            }
            print()
        }
    }
    
    public func nextVertex(_ v:Int) -> Int {
        for i in 0..<self.nVertexs {
            if adj[v][i] == 1 && vertexs[i].visited == false {
                return i
            }
        }
        return -1
    }
    
    internal func showVertex(_ v:Int) {
        print(vertexs[v].key)
    }
}


extension Graph {
    public func dfs() {
        // 存储已经被标记的顶点
        var stack = [Int]()
        
        self.vertexs.first?.visited = true
        showVertex(0)
        stack.append(0)
        
        var v:Int
        while stack.count > 0 {
            v = nextVertex(stack.last!)
            if v < 0 {
               let _ = stack.popLast()
            } else {
                vertexs[v].visited = true
                showVertex(v)
                stack.append(v)
            }
        }
    }
    
    public func bfs() {
        var queue = [Int]()
        
        vertexs.first?.visited = true
        showVertex(0)
        queue.append(0)
        
        var v1 = 0, v2 = 0
        while queue.count > 0 {
            v1 = queue.first!
            queue.removeFirst()
            v2 = nextVertex(v1)
            while v2 > 0 {
                vertexs[v2].visited = true
                showVertex(v2)
                queue.append(v2)
                v2 = nextVertex(v1)
            }
        }
    }
}

extension Graph {
    public func prime()-> Int {
        
        var dist = [Int](repeating: 0, count: nVertexs)
        
        var currIndex = 0
        var sum = 0
        
        vertexs[currIndex].visited = true
        for i in 0..<nVertexs {
            dist[i] = adj[currIndex][i]
        }
        showVertex(currIndex)
        
        for _ in 1..<nVertexs {
            
            // find current min
            var flag = Int.max
            for i in 0..<nVertexs {
                if vertexs[i].visited == false && dist[i] != 0 && dist[i] < flag {
                    flag = dist[i]
                    currIndex = i
                }
            }
            
            // update
            showVertex(currIndex)
            vertexs[currIndex].visited = true
            sum += flag
            for i in 0..<nVertexs {
                if vertexs[i].visited == false  && dist[i] > adj[currIndex][i] {
                    dist[i] = adj[currIndex][i]
                }
            }
        }
        
        return sum
    }
}

extension Graph {
    func dijkstra(start:Int, end:Int) {
        
        var dist = [Int](repeating: Int.max, count: nVertexs)
        var pre = [Int](repeating: Int.max, count: nVertexs)
        dist[start] = 0
        
        for i in 0..<nVertexs {
            pre[i] = i
        }
        for _ in 0..<nVertexs {
            
            // find current min
            var flag = Int.max
            var index = -1
            for i in 0..<nVertexs {
                if vertexs[i].visited == false  && dist[i] < flag {
                    flag = dist[i]
                    index = i
                }
            }
            
            if index == -1 {
                return
            }
            
            // update
            vertexs[index].visited = true
            for i in 0..<nVertexs {
                let weight = adj[index][i]
                print(weight)
                if vertexs[i].visited == false  && weight != Int.max && dist[index] + weight < dist[i]  {
                    dist[i] = adj[index][i] + dist[index]
                    pre[i] = index
                }
            }
        }
        print("->", vertexs[start].key)
        printPath(start: 0, end: end, pre: pre)
    }
    
    func printPath( start:Int, end:Int, pre:[Int]) {
        if start == end {
            return
        }
        printPath(start: start, end: pre[end], pre: pre)
        print("->", vertexs[end].key)
    }
}

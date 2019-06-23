//
//  ViewController.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let graph = Graph<Character>(6)
        
        graph.addVertex("A")
        graph.addVertex("B")
        graph.addVertex("C")
        graph.addVertex("D")
        graph.addVertex("E")
        graph.addVertex("F")
        
   
        graph.addEdge(start: 0, end: 1, weight: 7)
        graph.addEdge(start: 0, end: 2, weight: 4)
        graph.addEdge(start: 1, end: 2, weight: 6)
        graph.addEdge(start: 1, end: 3, weight: 2)
        graph.addEdge(start: 1, end: 5, weight: 4)
        graph.addEdge(start: 2, end: 5, weight: 8)
        graph.addEdge(start: 3, end: 5, weight: 7)
        graph.addEdge(start: 4, end: 5, weight: 1)
        graph.addEdge(start: 2, end: 4, weight: 9)
        
//        graph.printMatrix()
        
//        graph.dfs()
        
//        graph.bfs()
        
//        print(graph.prime())
        
        graph.dijkstra(start: 0, end: 3)
        
        
        let a = "abababbcdd"
        
        let b = "cd"
        
        print(a.rkSearch(b))
    }
}


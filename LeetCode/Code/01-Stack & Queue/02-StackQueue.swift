//
//  02-StackQueue.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/12.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class  StackQueue {
    var stackPush = [Int]()
    var stackPop = [Int]()
    
    func enqueue(_ value:Int) {
        stackPush.append(value)
    }
    
    func dequeue() -> Int {
        if stackPop.isEmpty {
            while !stackPush.isEmpty {
                stackPop.append(stackPop.removeLast())
            }
        }
        return stackPop.removeLast()
    }
}

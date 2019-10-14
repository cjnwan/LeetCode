//
//  03-JosephusKill.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/14.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class JosephusKill {
    func josephus(_ head:ListNode?, _ m:Int)->ListNode? {
        if head == nil || head?.next == nil || m < 1 {
            return head
        }
        var head = head
        var last = head
        while last?.next !== head {
            last = last?.next
        }
        
        var count = 0
        
        while head !== last {
            count += 1
            if count == m {
                last?.next = head?.next
                count = 0
            } else {
                last = last?.next
            }
            head = last?.next
        }
        return head
    }
}

//
//  06-KReverse.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/14.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation


class KReverse {
    func kreverse(_ head:ListNode?, _ k:Int)->ListNode? {
        if k < 2 {
            return head
        }
        var head = head
        var curr = head
        var count = 1
        
        var pre : ListNode?
        var next : ListNode?
        var start : ListNode?
        
        while curr != nil {
            next = curr?.next
            if  count == k {
                if pre == nil {
                    start = head
                    head = curr
                } else {
                    start = pre?.next
                }
                reversek(pre, next,start, curr)
                pre = start
                count = 0
            }
            
            count += 1
            curr = next
        }
        return head
    }
    
    func reversek(_ left:ListNode?, _ right:ListNode?, _ start:ListNode?, _ end:ListNode?) {
        var pre = start
        var cur = start?.next
        var next : ListNode?
        while cur !== right {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        if left != nil {
            left?.next = end
        }
        start?.next = right
    }
}

//
//  Reverse Linked List.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation



class ReverseLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = pre
            pre = curr
            curr = next
        }
        return pre
    }
    
    func reversePart(_ head: ListNode?, _ from:Int, _ to:Int) -> ListNode? {
        
        var len = 0
        var tPre:ListNode? = nil
        var tPos:ListNode? = nil
        var node = head
        while node != nil {
            len += 1
            if len ==  from - 1 {
                tPre = node
            }
            if len == to + 1 {
                tPos = node
            }
            node = node?.next
        }
        
        if from > to || from < 1 || to > len {
            return head
        }
        
        node = tPre == nil ? head : tPre?.next
        var node2 = node?.next
        node?.next = tPos
        
        var next:ListNode? = nil
        while node2 !== tPos {
            next = node2?.next
            node2?.next = node
            node = node2
            node2 = next
        }
        
        if tPre != nil {
            tPre?.next = node
            return head
        }
        return node
    }
}

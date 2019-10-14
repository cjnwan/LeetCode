//
//  02-RemoveNode.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/14.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveNode {
    func removeMiddleNode (_ head:ListNode?)->ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var head = head
        if head?.next?.next == nil {
            return head?.next
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre = head
        
        var curr = head?.next?.next
        
        
        while curr != nil && curr?.next?.next != nil {
            curr = curr?.next?.next
            pre = pre?.next
        }
        pre?.next = pre?.next?.next
        
//        var fast = head
//        var slow = head
//        var pre = head
//
//        while fast != nil && fast?.next != nil {
//            fast = fast?.next?.next
//            pre = slow
//            slow = slow?.next
//        }
//
//        pre?.next = slow?.next
        return dummy.next
    }
}

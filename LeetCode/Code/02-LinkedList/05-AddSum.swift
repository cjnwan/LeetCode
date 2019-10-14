//
//  05-AddSum.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/14.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class AddSum {
    func getAddedList(_ head1:ListNode?, _ head2:ListNode?)->ListNode? {
        if head1 == nil {
            return head2
        }
        
        if head2 == nil {
            return head1
        }
        
        var head1 = head1
        var head2 = head2
        
        head1 = reverse(head1)
        head2 = reverse(head2)
        
        var pre:ListNode? = nil
        var node:ListNode? = nil
        var ca = 0
        
        var n1 = head1
        var n2 = head2
        
        while n1 != nil || n2 != nil {
            let a = ((n1 != nil) ? n1!.val : 0)
            let b = ((n2 != nil) ? n2!.val : 0)
            let value =  a + b + ca
            pre = node
            node = ListNode(value%10)
            node?.next = pre
            ca = value / 10
            n1 = n1?.next
            n2 = n2?.next
        }
        
        if ca == 1 {
            pre = node
            node = ListNode(1)
            node?.next = pre
        }
        
        return node
        
    }
    
    func reverse(_ head:ListNode?)->ListNode? {
        
        var pre:ListNode? = nil
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = pre
            pre = curr
            curr = next
        }
        
        return pre
    }
}

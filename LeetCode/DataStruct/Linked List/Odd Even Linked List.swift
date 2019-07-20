//
//  Odd Even Linked List.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/21.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class OddEvenLinkedList {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        let dummy:ListNode? = ListNode(0)
        dummy?.next = head
        var pre = head
        var curr = head
        
        var even:ListNode? = nil
        var evenCurr:ListNode? = nil
        var index = 1
        while curr != nil {
            // last
            if curr?.next == nil {
                if index % 2 == 0 && even != nil {
                    evenCurr?.next = curr
                    evenCurr = evenCurr?.next
                    curr = pre
                } else {
                    evenCurr?.next = nil
                }
                break
            }
            if index != 0 && index % 2 == 0 {
                if even == nil {
                    even = curr
                    evenCurr = even
                    pre?.next = curr?.next
                } else {
                    pre?.next = curr?.next
                    evenCurr?.next = curr
                    evenCurr = evenCurr?.next
                }
            }
            pre = curr
            curr = curr?.next
            index += 1
        }
        
        curr?.next = even
        return dummy?.next
    }
}

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
}

//
//  Remove Linked List Elements.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/19.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveLinkedListElements {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy:ListNode? = ListNode(0)
        dummy?.next = head
        var curr = head
        var pre = dummy
        while curr != nil {
            if curr?.val == val {
                pre?.next = curr?.next
            } else {
                pre = curr
            }
            
            curr = curr?.next
        }
        return dummy?.next
    }
}

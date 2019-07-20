//
//  Remove Duplicates from Sorted List II.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/19.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveDuplicatesfromSortedListII {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy:ListNode? = ListNode(0)
        dummy?.next = head
        var pre = dummy
        var curr = head
        var next = head?.next
        while curr != nil {
            if curr?.val  == next?.val {
                while curr?.val  == next?.val {
                    curr = next
                    next = curr?.next
                }
                pre?.next = next
            } else {
                pre = curr
            }
            curr = next
            next = next?.next
        }
        return dummy?.next
    }
}

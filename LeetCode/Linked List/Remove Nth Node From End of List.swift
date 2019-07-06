//
//  Remove Nth Node From End of List.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/21.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class RemoveNthNodeFromEndofList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy:ListNode? = ListNode(0)
        dummy?.next = head
        var pre = dummy
        var slow: ListNode? = nil
        var fast = head
        var index = 0
        while fast != nil {
            index += 1
            fast = fast?.next
            if slow != nil {
                pre = slow
                slow = slow?.next
            } else {
                if index == n {
                    slow = head
                }
            }
        }
        if slow != nil {
            pre?.next = slow?.next
        }
        
        return dummy?.next
    }
}

//
//  Merge Two Sorted Lists.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/25.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class MergeTwoSortedLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        } else if l1 == nil && l2 != nil {
            return l2
        } else if l2 == nil && l1 != nil {
            return l1
        }
        
        let dummy:ListNode? = ListNode(0)
        var head:ListNode? = nil
        
        var curr1 = l1
        var curr2 = l2
        
        if curr1!.val <= curr2!.val {
            head = curr1
            curr1 = curr1?.next
        } else {
            head = curr2
            curr2 = curr2?.next
        }
        
        dummy?.next = head
        
        while curr1 != nil && curr2 != nil {
            
            let v1 = curr1!.val
            let v2 = curr2!.val
            
            if v1 < v2 {
                head?.next = curr1
                head = curr1
                curr1 = curr1?.next
            } else if v1 == v2 {
                head?.next = curr1
                head = curr1
                curr1 = curr1?.next
                head?.next = curr2
                head = curr2
                curr2 = curr2?.next
                
            } else {
                head?.next = curr2
                head = curr2
                curr2 = curr2?.next
            }
        }
        if curr1 == nil {
            head?.next = curr2
        } else {
            head?.next = curr1
        }
        return dummy?.next
    }
}

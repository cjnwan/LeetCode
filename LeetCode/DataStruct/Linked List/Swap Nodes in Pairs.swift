//
//  Swap Nodes in Pairs.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/18.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class SwapNodesinPairs {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy:ListNode? = ListNode(0)
        dummy?.next = head
        var pre = dummy
        var curr = head
        
        while curr != nil && curr?.next != nil {
            let next = curr?.next
            pre?.next = next
            curr?.next = next?.next
            next?.next = curr
            pre = curr
            curr = curr?.next
        }
        return dummy?.next
    }
}

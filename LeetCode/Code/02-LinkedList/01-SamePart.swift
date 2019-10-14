//
//  01-SamePart.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/14.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class SamePart {
    func printSamePart(_ head1: ListNode?, _ head2:ListNode?) {
        if head1 == nil || head2 == nil {
            return
        }
        
        var h1 = head1
        var h2 = head2
        
        while h1 != nil && h2 != nil {
            if h1!.val == h2!.val {
                print(h1!.val)
                h1 = h1?.next
                h2 = h2?.next
            } else if h1!.val < h2!.val {
                h1 = h1?.next
            } else {
                h2 = h2?.next
            }
        }
    }
}

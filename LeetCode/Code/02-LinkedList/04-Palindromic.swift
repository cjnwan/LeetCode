//
//  04-Palindromic.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/14.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Palindromic {
    func isPalindromic(_ head:ListNode?)->Bool {
        if head == nil {
            return false
        }
        
        if head?.next == nil {
            return true
        }
        var head = head
        var stack = [Int]()
        
        var cur = head
        
        while cur != nil {
            stack.append(cur!.val)
            cur = cur?.next
        }
        
        while head != nil {
            let top = stack.removeLast()
            if top != head?.val {
                return false
            }
            head = head?.next
        }
        return true
        
    }
    
    func isPalindromic1(_ head:ListNode?)->Bool {
        if head == nil {
            return false
        }
        
        if head?.next == nil {
            return true
        }
       
        var n1 = head
        var n2 = head
        
        // 查找中间节点
        while n2?.next != nil && n2?.next?.next != nil {
            n2 = n2?.next?.next
            n1 = n1?.next
        }
        
        n2 = n1?.next
        n1?.next = nil
        
        var n3:ListNode? = nil
        while n2 != nil {
            n3 = n2?.next
            n2?.next = n1
            n1 = n2
            n2 = n3
        }
        
        n3 = n1
        n2 = head
        
        var res = true
        while n1 != nil && n2 != nil {
            if n1?.val != n2?.val {
                res = false
                break;
            }
            n1 = n1?.next
            n2 = n2?.next
            
        }
        
        // 恢复链表
        n1 = n3?.next
        n3?.next = nil
        
        while n1 != nil {
            n2 = n1?.next
            n1?.next = n3
            n3 = n1
            n1 = n2
        }
        
        return res
    }
}

//
//  07-Exercise.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/10/15.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class Exercise {
    
    // Reverse
    func reverse(_ head:ListNode?)->ListNode? {
        if head == nil {
            return head
        }
        
        var curr = head
        var pre:ListNode? = nil
        
        while curr != nil {
            let next = curr?.next
            curr?.next = pre
            pre = curr
            curr = next
        }
        
        return pre
    }
    
    // Reverse With Index
    func reverse(_ head:ListNode?, _ from:Int, _ to:Int) -> ListNode? {
        var tPre:ListNode? = nil
        var tPos:ListNode? = nil
        var len = 0
        var node = head
        
        while node != nil {
            len += 1
            if len == from - 1 {
                tPre = node
            }
            
            if len == to + 1 {
                tPos = node
            }
            
            node = node?.next
        }
        
        if from < 1 || to > len {
            return head
        }
        
        node = tPre == nil ? head : tPre?.next // start
        var curr = node?.next // next
        
        node?.next = tPos // connect right
        
        while curr !== tPos {
            let next = curr?.next
            curr?.next = node
            node = curr
            curr = next
            
        }
        
        if tPre != nil { // connect right
            tPre?.next = node
            return head
        }
        return node
    }
    
    // Reverse K
    func reverse(_ head:ListNode?, _ k:Int)->ListNode? {
        var count = 1
        var head = head
        var curr = head
        var pre : ListNode? = nil
        var start : ListNode? = nil
        while curr != nil {
            let next = curr?.next
            if count == k {
                if pre == nil {
                    start = head
                    head = curr
                } else {
                    start = pre?.next
                }
                reverse(pre, start, curr, next)
                pre = start
                count = 0
            }
            count += 1
            curr = next
        }
        return head
    }
    
    // Reverse K From End
    func reverseE(_ head:ListNode?, _ k:Int)->ListNode? {
        var len = 0
        var temp = head
        while temp != nil {
            len += 1
            temp = temp?.next
        }
        
        var count = 1
        var head = head
        var curr = head
        var pre : ListNode? = nil
        var start : ListNode? = nil
        while curr != nil {
            let next = curr?.next
            if pre == nil && count == len%k {
                start = head
                head = curr
                reverse(nil, start, curr, next)
                pre = start
                count = 0
            } else if count == k {
                start = pre?.next
                reverse(pre, start, curr, next)
                pre = start
                count = 0
            }
            count += 1
            curr = next
        }
        return head
        
    }
    
    func reverse(_ left:ListNode?, _ start:ListNode?, _ end:ListNode?, _ right:ListNode?) {
        var pre = start
        var curr = start?.next
        
        while curr !== right {
            let next = curr?.next
            curr?.next = pre
            pre = curr
            curr = next
        }
        if left != nil { // connect left
            left?.next = end
        }
        
        start?.next = right // connect right
    }
    
    // DeleteK
    func deleteK(_ head:ListNode?, _ k:Int)->ListNode? {
        var count = 0
        var curr = head
        var target : ListNode? = nil
        var pre :ListNode? = nil
        
        while curr != nil {
            count += 1
            if count == k {
                target = head
            }
            curr = curr?.next
            if target != nil && count != k {
                pre = target
                target = target?.next
            }
        }
        
        if target === head {
            return head?.next
        }
        
        if target != nil {
            pre?.next = target?.next
        }
        return head
    }
    
    // Delete Mid
    func deleteMid(_ head:ListNode?)->ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        if head?.next?.next == nil {
            return head?.next
        }
        
        var pre = head
        var cur = head?.next?.next
        
        while cur?.next != nil && cur?.next?.next != nil {
            pre = pre?.next
            cur = cur?.next?.next
        }
        pre?.next = pre?.next?.next
        return head
    }
    
    // is Palindromic
    func isPalindromic(_ head:ListNode?)->Bool {
        if head == nil || head?.next == nil {
            return true
        }
        
        var left = head
        var right = head
        
        // find Mid
        while right?.next != nil && right?.next?.next != nil {
            left = left?.next
            right = right?.next?.next
        }
        
        // reverse
        right = left?.next // right first
        left?.next = nil

        var node:ListNode? = nil
        while right != nil {
            node = right?.next
            right?.next = left
            left = right
            right = node
        }
        
        right = head
        
        var res = true
        while left != nil && right != nil {
            if left?.val != right?.val {
                res = false
                break
            }
            left = left?.next
            right = right?.next
        }
        return res
    }
    
    // Add Two List
    func addList(_ head1:ListNode?, _ head2:ListNode?) -> ListNode? {
        var head1 = head1
        var head2 = head2
        
        head1 = reverse(head1)
        head2 = reverse(head2)
        
        var ca = 0
        var h1 = head1
        var h2 = head2
        
        var pre : ListNode? = nil
        var node: ListNode? = nil
        
        while h1 != nil || h2 != nil {
            var n1 = 0
            if h1 != nil {
                n1 = h1!.val
            }
            
            var n2 = 0
            if h2 != nil {
                n2 = h2!.val
            }
            let value = n1 + n2 + ca
            
            pre = node
            node = ListNode(value%10)
            node?.next = pre
        
            ca = value/10
            h1 = h1?.next
            h2 = h2?.next
        }
        
        if ca == 1 {
            pre = node
            node = ListNode(1)
            node?.next = pre
        }
        
       return node
    }
    
    // Merge Two List
    func merge(_ head1:ListNode?, _ head2:ListNode?)->ListNode? {
        if head1 == nil {
            return head2
        }
        
        if head2 == nil {
            return head1
        }
        
        let head = head1!.val < head2!.val ? head1 : head2
        var cur1 = head === head1 ? head1 : head2
        var cur2 = head === head1 ? head2 : head1
        
        var pre:ListNode? = nil
        var next:ListNode? = nil
        // 0237
        // 13579
        while cur1 != nil && cur2 != nil {
            if cur1!.val <=  cur2!.val {
                pre = cur1
                cur1 = cur1?.next
            } else {
                next = cur2?.next
                pre?.next = cur2
                cur2?.next = cur1
                pre = cur2
                cur2 = next
            }
        }
        
        pre?.next = cur1 == nil ? cur2 : cur1
        return head
    }
    
    // Swap
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var pre = head
        var curr = head?.next
        
        while curr != nil && curr?.next != nil {
            let next = curr?.next
            curr?.next = pre
            pre?.next = next?.next
            pre = next
            curr = next?.next
        }
        return head
    }
}

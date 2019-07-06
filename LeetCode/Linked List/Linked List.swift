//
//  Linked List.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/6/11.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class LinkedList {
    var head:ListNode? = nil
    
    public func build(_ nums:[Int]) {
        var curr: ListNode? = nil
        for i in 0..<nums.count {
            let node = ListNode(nums[i])
            if i == 0 {
                head = node
                curr = node
            } else {
                curr?.next = node
                curr = node;
            }
        }
    }
    
    public func print() {
        var curr = head
        while curr != nil {
            Swift.print(curr?.val ?? "nil")
            curr = curr?.next
        }
    }
}

extension LinkedList {
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

extension LinkedList {
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

extension LinkedList {
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

extension LinkedList {
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

extension LinkedList {
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

extension LinkedList {
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

extension LinkedList {
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

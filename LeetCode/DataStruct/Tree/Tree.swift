//
//  Tree.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/17.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

public class TreeeNode {
    public var val: Int
    public var left: TreeeNode?
    public var right: TreeeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class Treee {
    var root : TreeeNode?
    fileprivate var nums :[Int?]
    fileprivate var index = -1
     var sum = 0
    
    init(_ nums:[Int?], _ needBuild:Bool) {
        self.nums = nums
        if needBuild {
            self.root = build()
        }
    }
    
    // 先序创建
    public func build() -> TreeeNode? {
        self.index += 1
        if self.index >= 0 && self.index < self.nums.count {
            let item = self.nums[self.index]
            
            if item == nil {
                return nil
            } else {
                let node = TreeeNode(item!)
                node.left = build()
                node.right = build()
                return node
            }
        }
        return nil
    }
    
    // 按层创建
    public func buildbyLevel() {
        
        var front = 1,rear = 0
        var queue = [TreeeNode?](repeating: nil, count: nums.count + 1)
        for i in 0..<nums.count {
            var node:TreeeNode? = nil
            if let item =  nums[i] {
                 node = TreeeNode(item)
            }
            rear += 1
            queue[rear] = node
            if rear == 1 {
                root = node
            } else {
                if node != nil && queue[front] != nil {
                    if rear % 2 == 0 {
                        queue[front]?.left = node
                    } else {
                        queue[front]?.right = node
                    }
                }
                if rear % 2 == 1 {
                    front += 1
                }
            }
        }
    }
    
    public func preOrder() {
        preOrder(node: root)
    }
    
    public func preOrder(node:TreeeNode?) {
        if node == nil {
            return
        }
        print(node!.val)
        preOrder(node: node?.left)
        preOrder(node: node?.right)
    }
    
    public func preOrder1(_ root:TreeeNode?) {
        var stack = [TreeeNode?]()
        var root = root
        while root != nil || stack.count > 0 {
            while root != nil {
                print(root?.val)
                stack.append(root)
                root = root?.left
            }
            if stack.count > 0 {
                let curr = stack.popLast()!
                root = curr?.right
            }
        }
    }
    
    
    public func middleOrder() -> [Int] {
        var result = [Int]()
        middleOrder(node: root, &result)
        return result
    }
    
    public func middleOrder(node:TreeeNode?, _ a: inout [Int]) {
        if node == nil {
            return
        }
        middleOrder(node: node?.left, &a)
        a.append(node!.val)
        print(node!.val)
        middleOrder(node: node?.right,&a)
    }
    
    public func middleOrder1(_ node:TreeeNode?) {
        var stack = [TreeeNode?]()
        var node = node
        
        while node != nil || stack.count > 0 {
            while node != nil {
                stack.append(node)
                node = node?.left
            }
            if stack.count > 0 {
                let curr = stack.popLast()!
                print(curr!.val)
                node = curr?.right
            }
        }
    }
    
    
    
    public func postOrder() {
        postOrder(node: root)
    }
    
    public func postOrder(node:TreeeNode?) {
        if node == nil {
            return
        }
        postOrder(node: node?.left)
        postOrder(node: node?.right)
        print(node!.val)
    }
    
    public func postOrder1(root:TreeeNode?) {
        var stack = [TreeeNode?]()
        stack.append(root)
        
        while stack.count > 0 {
            let curr = stack.removeLast()
            
            if curr != nil {
                print(curr!.val)
                
                if curr?.left != nil {
                    stack.append(curr?.left)
                }
                
                
                // 栈取后面所以先添加右节点
                if curr?.right != nil {
                    stack.append(curr?.right)
                }
                
                
                
            }
        }
    }
    
    public func levelOrder() -> [[Int]] {
        if root == nil {
            return []
        }
        let node = root
        var queue = [TreeeNode?]()
        var result = [[Int]]()
        queue.append(node)
        while queue.count > 0 {
            var item = [Int]()
            var size = queue.count
        
            while size > 0 {
                let curr = queue.removeFirst()
                item.append(curr!.val)
                
                size -= 1
                if curr?.left != nil {
                    queue.append(curr?.left)
                }
                
                if curr?.right != nil {
                    queue.append(curr?.right)
                }
                
            }
            
            if item.count > 0 {
                result.insert(item, at: 0)
            }
            
        }
        return result
    }
    
    public func levelOrderBottom(_ root: TreeeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        let node = root
        var queue = [TreeeNode?]()
        var result = [[Int]]()
        queue.append(node)
        while queue.count > 0 {
            var item = [Int]()
            var size = queue.count
            
            while size > 0 {
                let curr = queue.removeFirst()
                item.append(curr!.val)
                
                size -= 1
                if curr?.left != nil {
                    queue.append(curr?.left)
                }
                
                if curr?.right != nil {
                    queue.append(curr?.right)
                }
                
            }
            
            if item.count > 0 {
                result.insert(item, at: 0)
            }
            
        }
        return result
    }
}

extension Treee {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeeNode? {
        return buildTree(nums,0,nums.count)
    }
    
    func buildTree(_ nums:[Int], _ lo:Int, _ hi:Int) -> TreeeNode? {
        if lo >= hi {
            return nil
        }
        
        let index = maxIndex(nums,lo,hi)
        
        let root = TreeeNode(nums[index])
        
        root.left = buildTree(nums,lo,index)
        root.right = buildTree(nums,index+1,hi)
        
        return root
    }
    
    func maxIndex(_ nums:[Int], _ lo:Int, _ hi:Int) -> Int {
        var index = lo
        for i in lo..<hi {
            if nums[i] > nums[index] {
                index = i
            }
        }
        return index
    }
}

extension Treee {
    func mergeTrees(_ t1: TreeeNode?, _ t2: TreeeNode?) -> TreeeNode? {
        if t1 == nil {
            return t2
        }
        
        if t2 == nil {
            return t1
        }
        
        let node = TreeeNode(t1!.val + t2!.val)
        node.left = mergeTrees(t1?.left,t2?.left)
        node.right = mergeTrees(t1?.right,t2?.right)
        
        return node
    }
}

extension Treee {
    func maxDepth(_ root: TreeeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = maxDepth(root?.left) + 1
        let right = maxDepth(root?.right) + 1
        return max(left,right)
    }
}

extension Treee {
    func invertTree(_ root: TreeeNode?) -> TreeeNode? {
        if root == nil {
            return nil
        }
        
        let left = invertTree(root?.left)
        let right = invertTree(root?.right)
        
        root?.left = right
        root?.right = left
        
        return root
    }
}

extension Treee {
    func searchBST(_ root:TreeeNode?, _ val: Int) -> TreeeNode? {
        if root == nil {
            return nil
        }
        
        if val > root!.val {
           return searchBST(root?.right, val)
        } else if val < root!.val {
            return searchBST(root?.left, val)
        } else {
            return root
        }
    }
}

extension Treee {
    func isSameTree(_ p: TreeeNode?, _ q: TreeeNode?) -> Bool {
        
        if q == nil && p == nil {
            return true
        }

        if q == nil || p == nil {
            return false
        }
        
        if q?.val !=  p?.val {
            return false
        }
        
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

extension Treee {
    func isSymmetric(_ root: TreeeNode?) -> Bool {
    
        if root == nil {
            return true
        } else {
            return isSymmetric(root?.left, root?.right)
        }
    }
    
    func isSymmetric(_ p:TreeeNode?, _ q:TreeeNode?)-> Bool {
        
        if q == nil && p == nil {
            return true
        }
        
        if q == nil || p == nil {
            return false
        }
        
        if q?.val !=  p?.val {
            return false
        }
        
        return isSameTree(p?.left, q?.right) && isSameTree(p?.right, q?.left)
    }
}

extension Treee {
//    func isBalanced(_ root: TreeeNode?) -> Bool {
//        if root == nil {
//            return true
//        }
//
//        return abs(height(root?.left) - height(root?.right)) <= 1
//    }
//
//    func height(_ root:TreeeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        return max(height(root?.left), height(root?.right)) + 1
//    }
}

extension Treee {
    func diameterOfBinaryTree(_ root: TreeeNode?) -> Int {
        var result = [Int]()
        
        var left = root?.left
        while left != nil {
            result.append(left!.val)
            left = left?.left
        }
        
        var right = root?.right
        while right != nil {
            result.append(right!.val)
            right = right?.right
        }
        
        return result.count
    }
}

extension Treee {
   
    func sumOfLeftLeaves(_ root: TreeeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        
        
        if root?.left != nil && root?.left?.left == nil && root?.left?.right == nil {
            let left = root?.left!
            sum += left!.val
        }
        
        sumOfLeftLeaves(root?.left)
        sumOfLeftLeaves(root?.right)
        
        return sum
    }
}

extension Treee {
    func hasPathSum(_ root: TreeeNode?, _ sum: Int) -> Bool {
        return pathSum(root, 0, sum) == -1
    }
    
    func pathSum(_ root: TreeeNode?, _ sum: Int, _ total:Int) -> Int {
        
        var sum = sum
        
        if root?.left == nil && root?.right == nil {
            return 0
        }
        
        sum += pathSum(root?.left, sum, total)
        
        sum += pathSum(root?.right, sum,total)
        
        if sum == total {
            return -1
        }
        
        return sum
    }
}

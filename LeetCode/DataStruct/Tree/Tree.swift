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
                print(root!.val)
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

extension Treee {
    func rangeSumBST(_ root: TreeeNode?, _ L: Int, _ R: Int) -> Int {
        
        var sum = 0
        helper(root, L, R,&sum)
        return sum
        
    }
    
    func helper(_ root:TreeeNode?,_ L: Int, _ R: Int, _ sum:inout Int) {
        if root?.val == nil {
            return
        }
        if root!.val >= L && root!.val <= R {
            sum += root!.val
        }
        if root!.val > L {
            helper(root?.left, L, R, &sum)
        }
        if root!.val < R {
            helper(root?.right, L, R, &sum)
        }
    }
}

extension Treee {
    func minDiffInBST(_ root: TreeeNode?) -> Int {
        var min = 100000
        minDiffInBST1(root, &min)
        return min
    }
    
    func minDiffInBST1(_ root: TreeeNode?, _ minV:inout Int) {
        if root == nil {
            return
        }
        
        if root?.left ==  nil && root?.right == nil {
            return
        }
        
        if root?.left != nil {
            var maxNode = root?.left
            while maxNode?.right != nil {
                maxNode = maxNode?.right
            }
            minV = min(minV, root!.val-maxNode!.val)
        }
        
        if root?.right != nil {
            var minNode = root?.right
            while minNode?.left != nil {
                minNode = minNode?.left
            }
            minV = min(minV, minNode!.val - root!.val)
        }
        
        minDiffInBST1(root?.left,&minV)
        minDiffInBST1(root?.right, &minV)
    }
}

extension Treee {
    func isBalanced(_ root: TreeeNode?) -> Bool {
        var isBalance = true
        let _ = isBalanced1(root,&isBalance)
        return isBalance
    }
    
    
    func isBalanced1(_ root: TreeeNode?, _ isBalance:inout Bool) -> Int {
        if root == nil {
            return 0
        }
        
        let left = isBalanced1(root?.left,&isBalance) + 1
        let right  = isBalanced1(root?.right,&isBalance) + 1
        
        if abs(left-right) > 1 {
            isBalance = false
        }
        
        return max(left, right)
    }
}

extension Treee {
    func buildTreeNOPre(_ inorder: [Int], _ postorder: [Int]) -> TreeeNode? {
        let inCount = inorder.count
        let poCount = postorder.count
        return buildTree1(inorder, postorder, 0, inCount-1, 0, poCount-1)
    }
    
    func buildTree1(_ inorder: [Int], _ postorder: [Int], _ il:Int, _ ir:Int, _ pl:Int, _ pr:Int ) -> TreeeNode? {
        
        if il > ir || pl > pr {
            return nil
        }
        
        let rootValue = postorder[pr]
        var index = 0
        for i in il..<ir+1 {
            if inorder[i] == rootValue {
                index = i
                break
            }
        }
        
        let root = TreeeNode(rootValue)
        
        root.left = buildTree1(inorder, postorder, il, index-1, pl, index-1-il+pl)
        root.right = buildTree1(inorder, postorder, index+1,ir, pr+index-ir, pr-1)
        return root
    }
    
}

extension Treee {
    func buildTreeNOPost(_ preorder: [Int], _ inorder: [Int]) -> TreeeNode? {
        let preCount = preorder.count
        let inCount = inorder.count
        return buildTree2(preorder, inorder, 0, preCount-1, 0, inCount-1)
    }
    
    func buildTree2(_ preorder: [Int], _ inorder: [Int], _ il:Int, _ ir:Int, _ pl:Int, _ pr:Int ) -> TreeeNode? {
        
        if il > ir || pl > pr {
            return nil
        }
        
        let rootValue = preorder[il]
        var index = 0
        for i in pl..<pr+1 {
            if inorder[i] == rootValue {
                index = i
                break
            }
        }
        
        let root = TreeeNode(rootValue)
        
        root.left = buildTree2(preorder, inorder, il+1, il+index-pl, pl, index-1)
        root.right = buildTree2(preorder, inorder, il + index - pl + 1,ir, index+1, pr)
        return root
    }
}

extension Treee {
    func rightSideView(_ root: TreeeNode?) -> [Int] {
        var res = [Int]()
        rightSideView1(root, 0, &res)
        return res
    }
    
    func rightSideView1(_ root: TreeeNode?,_ level:Int, _ res:inout[Int]) {
        if root == nil {
            return
        }
        
        if level == res.count {
            res.append(root!.val)
        }
        
        rightSideView1(root?.right, level+1, &res)
        rightSideView1(root?.left, level+1, &res)
    }
}

extension Treee {
    func leafSimilar(_ root1: TreeeNode?, _ root2: TreeeNode?) -> Bool {
        var res1 = [Int]()
        leafSimilar1(root1, &res1)
        
        var res2 = [Int]()
        leafSimilar1(root2, &res2)
        
        return res1 == res2 && res1.count == res2.count
    }
    
    func leafSimilar1(_ root: TreeeNode?, _ res:inout[Int]) {
        if root == nil {
            return
        }
        if root?.left == nil && root?.right == nil {
            res.append(root!.val)
        }

        leafSimilar1(root?.left, &res)
        leafSimilar1(root?.right, &res)
        
    }
}

extension Treee {
    func binaryTreePaths(_ root: TreeeNode?) -> [String] {
        var res  = [String]()
        binaryTreePaths1(root, &res,"")
        
        return res
    }
    
    func binaryTreePaths1(_ root: TreeeNode?,_ res:inout[String], _ cur:String) {
        if root == nil {
            return
        }
        if root?.left == nil && root?.right == nil {
            var cur = cur+"\(root!.val)"
            
            res.append(cur)
        }
        
        binaryTreePaths1(root?.left, &res,cur+"\(root!.val)->")
        binaryTreePaths1(root?.right, &res,cur+"\(root!.val)->")
    }
}

extension Treee {
    func largestValues(_ root: TreeeNode?) -> [Int] {
        var res = [Int]()
        
        largestValues1(root,0,&res)
        return res
    }
    
    func largestValues1(_ root: TreeeNode?, _ level:Int, _ res:inout[Int]) {
        if root == nil {
            return
        }
        
        if res.count == level {
            res.append(root!.val)
        } else {
            if root!.val > res[level] {
                res[level] = root!.val
            }
        }
        
        largestValues1(root?.right, level+1, &res)
        largestValues1(root?.left, level+1, &res)
    }
}

extension Treee {
    func levelOrderBottom2(_ root: TreeeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var stack = [[Int]]()
        var queue = [TreeeNode?]()
        queue.append(root)
        while queue.count > 0 {
            
            let count = queue.count
            var res  = [Int]()
            for i in 0..<count {
                let curr = queue.removeFirst()
                res.append(curr!.val)
                if curr!.left != nil {
                    queue.append(curr!.left)
                }
                if curr!.right != nil {
                    queue.append(curr!.right)
                }
            }
            stack.insert(res, at: 0)
        }
        return stack
    }
}

extension Treee {
    func preOrderNORecursive(_ root:TreeeNode?) {
        if root == nil {
            return
        }
        
        var stack = [TreeeNode?]()
        stack.append(root)
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            print(node!.val)
            if node!.right != nil {
                stack.append(node!.right)
            }
            if node!.left != nil {
                stack.append(node!.left)
            }
        }
    }
    
    func inOrderNoRecurisive(_ root:TreeeNode?) {
        if root == nil {
            return
        }
        var root = root
        var stack = [TreeeNode?]()
        while !stack.isEmpty || root != nil {
            if root != nil {
                stack.append(root)
                root = root?.left
            } else {
                root = stack.removeLast()
                print(root!.val)
                root = root?.right
            }
        }
    }
    
    func postOrderNoRecurisive(_ root:TreeeNode?) {
        if root == nil {
            return
        }
        
        var s1 = [TreeeNode?]()
        var s2 = [TreeeNode?]()
        
        s1.append(root)
        while !s1.isEmpty {
            let node = s1.removeLast()
            s2.append(node)
            if node?.left != nil {
                s1.append(node?.left)
            }
            if node?.right != nil {
                s1.append(node?.right)
            }
        }
        
        while !s2.isEmpty {
            let node = s2.removeLast()
            print(node!.val)
        }
    }
}

extension Treee {
    func serialByPre(_ root:TreeeNode?)->String {
        if root == nil {
            return "#!"
        }
        
        var res = String(root!.val) + "!"
        res += serialByPre(root?.left)
        res += serialByPre(root?.right)
        return res
    }
    
    func reconByPreString(_ preStr:String) -> TreeeNode? {
        let values = preStr.split(separator: "!")
        
        var queue = [String]()
        
        for i in 0..<values.count {
            queue.append(String(values[i]))
        }
        return reconPreOrder(queue)
    }
    
    func reconPreOrder(_ queue:[String])->TreeeNode? {
        var queue = queue
        let value = queue.removeFirst()
        if value == "#" {
            return nil
        }
        let head = TreeeNode(Int(value) ?? 0)
        head.left = reconPreOrder(queue)
        head.right = reconPreOrder(queue)
        return head
    }
    
    func serialByLevel(_ root:TreeeNode?)->String {
        if root == nil {
            return "#!"
        }
        var res = String(root!.val) + "!"
        var queue = [TreeeNode?]()
        
        queue.append(root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node!.left != nil {
                res += String(node!.left!.val) + "!"
                queue.append(node!.left)
            } else {
                res += "#!"
            }
            
            if node!.right != nil {
                res += String(node!.right!.val) + "!"
                queue.append(node!.right)
            } else {
                res += "#!"
            }
        }
        return res
    }
    
    func reconByLevelString(_ levelStr:String)->TreeeNode? {
        let values = levelStr.split(separator: "!")
        var queue = [TreeeNode?]()
        
        var index = 0
        let head = generateNodeByString(String(values[index]))
        index += 1
        if head != nil {
            queue.append(head)
        }
        var node : TreeeNode?
        while !queue.isEmpty {
            node = queue.removeFirst()
            node?.left = generateNodeByString(String(values[index]))
            index += 1
            node?.right = generateNodeByString(String(values[index]))
            index += 1
            if node?.left != nil {
                queue.append(node?.left)
            }
            if node?.right != nil {
                queue.append(node?.right)
            }
        }
        return head
    }
    
    func generateNodeByString(_ str:String)->TreeeNode? {
        if str == "#" {
            return nil
        }
        return TreeeNode(Int(str) ?? 0)
    }
}

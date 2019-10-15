//
//  ViewController.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/5/30.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let l1 = LinkedList()
        let arr1 = [1,2,3,4]
        l1.build(arr1)
        
        
        let l2 = LinkedList()
        let arr2 = [1,3,5,7,9]
        l2.build(arr2)
    
        
//        let s = Palindromic()
//        l1.head = s.reversePart(l1.head, 2, 4)
//        l1.print()
        
        let s = Exercise()
        l1.head = s.swapPairs(l1.head)
        l1.print()
       
    }
}


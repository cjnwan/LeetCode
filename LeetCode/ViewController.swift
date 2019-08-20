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
        
        
        let nums = [1,3,2,5,3,nil,9]
        let t = Treee(nums,false)
        t.buildbyLevel()
        
//        let nums2 = [2]
//        let t1 = Treee(nums2,false)
//        t1.buildbyLevel()
        
        print(t.largestValues(t.root))
        
  
       
    }
}


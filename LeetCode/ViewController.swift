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
        
        
//        let nums = [1,3,2,5,3,nil,9]
//        let t = Treee(nums,false)
//        t.buildbyLevel()
//        print(t.largestValues(t.root))
        
        
        let p = LongestIncreasingSubsequence()
        let nums = [10,9,2,5,3,7,101,18]
        
        print(p.lengthOfLIS(nums))
  
       
    }
}


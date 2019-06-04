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
        
        let s = ContainsDuplicate2()
        let nums = [0,1,2,3,2,5], k = 4
        print(s.containsNearbyDuplicate(nums,k))
    }
}


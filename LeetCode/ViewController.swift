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
        
        let s = FourSum()
        let nums = [0,1,5,0,1,5,5,-4], target = 11
        print(s.fourSum(nums, target))
    }
}


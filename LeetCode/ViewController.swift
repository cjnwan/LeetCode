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
        
        let matrix = MaxLength()
        
        let arr  = [1,2,3,3]
        
        print(matrix.getMaxLength2(arr, 6))
  
       
    }
}


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
        
        
        
        
        let num = [5,4,8,11,nil,13,4,7,2,nil,1]
        
        let v = Treee(num,false)
        
        v.buildbyLevel()
        
        print(v.hasPathSum(v.root, 22))
       
    }
}


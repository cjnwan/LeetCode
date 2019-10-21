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
        
        
        
        let num = [1,2,3,4,nil,nil,5,nil,nil,nil,nil]
        let t = Treee(num,false)
        t.buildbyLevel()
        print(t.serialByLevel(t.root))
    
    }
}


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
        
        
        let s = Heaters()
        
        let house = [1,2,3,4]
        
        let heaters = [1,4]
        
        print(s.findRadius(house, heaters))
    }
}


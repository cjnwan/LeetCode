//
//  Find Smallest Letter Greater Than Target.swift
//  LeetCode
//
//  Created by 陈剑南 on 2019/7/16.
//  Copyright © 2019 gkoudai. All rights reserved.
//

import Foundation

class FindSmallestLetterGreaterThanTarget {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        for c in letters {
            if c >= target {
                return c
            }
        }
        return letters.first!
    }
}

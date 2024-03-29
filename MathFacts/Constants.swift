//
//  Constants.swift
//  MathFacts
//
//  Created by David Compton on 11/12/15.
//  Copyright © 2015 David Compton. All rights reserved.
//

import Foundation

enum MathProblem {
    
    case Addition
    case Subtraction
    case Multiplication
}

enum HardnessLevel {
    
    case Easy
    case Hard
}

//Costants
let MAX_NUMBER_RANGE: UInt32 = 10;
let MAX_PROBLEMS: Int = 100;
let NUMBER_VARIANCE = 5;
let MAX_LENGTH_OF_STATS_LIST = 5;
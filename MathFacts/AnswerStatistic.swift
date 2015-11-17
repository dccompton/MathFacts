//
//  AnswerStatistic.swift
//  MathFacts
//
//  Created by David Compton on 11/17/15.
//  Copyright © 2015 David Compton. All rights reserved.
//

import Foundation

class AnswerStatisctic {
    
    var timeToAnswer: Int {
        
        get {
            
            return self.timeToAnswer;
        }
        set {
            
            self.timeToAnswer = newValue;
        }
    }
    
    var problemQuestion: String {
        
        get {
            
            return self.problemQuestion;
        }
        set {
            self.problemQuestion = newValue;
        }
    }
}

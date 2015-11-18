//
//  SummaryViewController.swift
//  MathFacts
//
//  Created by David Compton on 11/7/15.
//  Copyright © 2015 David Compton. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var answerSummaryLabel: UILabel!
    @IBOutlet weak var mainMenuButton: UIButton!
    @IBOutlet weak var percentCorrectLabel: UILabel!
    
    //Properties
    var numberOfProblemsAnsweredCorrectly: Int!;
    var lastProblemNumberAnswered: Int!;
    
    var timerPerQuestion: Array<AnswerStatistic>!;
    var timerPerSession: Array<AnswerStatistic>!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if lastProblemNumberAnswered > 0 {
            
            answerSummaryLabel.text = "\(numberOfProblemsAnsweredCorrectly) right, \(lastProblemNumberAnswered - numberOfProblemsAnsweredCorrectly) wrong, out of \(lastProblemNumberAnswered)";
            
            var percent: Double = Double(numberOfProblemsAnsweredCorrectly) / Double(lastProblemNumberAnswered);
            percent = percent * 100;
            percentCorrectLabel.text = "\(Int(percent))% correct";
        }
        else {
            
            answerSummaryLabel.text = "There no problems answered";
            percentCorrectLabel.hidden = true;
        }
    
    }
    
    
}
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
    @IBOutlet weak var topFastestLabel: UILabel!
    @IBOutlet weak var topFastestHeaderLabel: UILabel!
    @IBOutlet weak var topSlowestHeaderLabel: UILabel!
    @IBOutlet weak var topSlowestLabel: UILabel!
    @IBOutlet weak var overallTimeLabel: UILabel!
    
    //Properties
    var numberOfProblemsAnsweredCorrectly: Int!;
    var lastProblemNumberAnswered: Int!;
    
    //Properties - Timers
    var timerPerQuestionSlowestList: Array<AnswerStatistic>!;
    var timerPerQuestionFastList: Array<AnswerStatistic>!;
    var timerCountPerSession: Int!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if lastProblemNumberAnswered > 0 {
            
            answerSummaryLabel.text = "\(numberOfProblemsAnsweredCorrectly) right, \(lastProblemNumberAnswered - numberOfProblemsAnsweredCorrectly) wrong, out of \(lastProblemNumberAnswered)";
            
            var percent: Double = Double(numberOfProblemsAnsweredCorrectly) / Double(lastProblemNumberAnswered);
            percent = percent * 100;
            percentCorrectLabel.text = "\(Int(percent))% correct";
            
            //Set and show the correct and wrong times
            displayStats(timerPerQuestionFastList, label: topFastestLabel);
            displayStats(timerPerQuestionSlowestList, label: topSlowestLabel);
            
            let (m, s) = secondsToHoursMinutesSeconds(timerCountPerSession);
            overallTimeLabel.text = "Overall Time: \(m) minutes and \(s) seconds.";
    
        }
        else {
            
            answerSummaryLabel.text = "There no problems answered";
            percentCorrectLabel.hidden = true;
        }
    
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int) {
        
        //return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60);
        return ((seconds % 3600) / 60, (seconds % 3600) % 60);
    }
    
    func displayStats(statList: Array<AnswerStatistic>, label: UILabel) {
            
        label.text = String();
            
        for stat in statList {
                
            label.text! += "\(stat.timeToAnswer) \((stat.timeToAnswer >= 2) ? "Seconds" : "Second").\tQuestion: \(stat.problemQuestion).\r";
        }
    }
}
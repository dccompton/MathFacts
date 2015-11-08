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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answerSummaryLabel.text = "\(numberOfProblemsAnsweredCorrectly) right, \(lastProblemNumberAnswered - numberOfProblemsAnsweredCorrectly) wrong, out of \(lastProblemNumberAnswered)";
        
        var percent = numberOfProblemsAnsweredCorrectly % lastProblemNumberAnswered;
        percent = percent * 100;
        percentCorrectLabel.text = "%\((numberOfProblemsAnsweredCorrectly / lastProblemNumberAnswered) * 100) correct";
    }
    
    
}
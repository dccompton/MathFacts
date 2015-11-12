//
//  AdditionViewControler.swift
//  MathFacts
//
//  Created by David Compton on 11/6/15.
//  Copyright © 2015 David Compton. All rights reserved.
//

import UIKit

class AdditionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        outOfLabel.hidden = true;
        
        nextButton.hidden = true;
        
        problemQuestionLabel.hidden = true;
        questionAnswer1.hidden = true;
        questionAnswer2.hidden = true;
        questionAnswer3.hidden = true;
        
        currentProblemNumber = 0;
        numberOfProblemsAnsweredCorrectly = 0;
        problemAnswer = 0;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "answerSummary" {
            let svc = segue.destinationViewController as! SummaryViewController;
            
            svc.numberOfProblemsAnsweredCorrectly = numberOfProblemsAnsweredCorrectly;
            svc.lastProblemNumberAnswered = currentProblemNumber;
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBOulets
    @IBOutlet weak var problemQuestionLabel: UILabel!
    @IBOutlet weak var questionAnswer1: UIButton!
    @IBOutlet weak var questionAnswer2: UIButton!
    @IBOutlet weak var questionAnswer3: UIButton!
    @IBOutlet weak var outOfLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //Costants
    let MAX_NUMBER_RANGE: UInt32 = 10;
    let MAX_PROBLEMS: Int = 2;
    
    //Variables
    var problemAnswer: Int = 0;
    var currentProblemNumber: Int = 0;
    var numberOfProblemsAnsweredCorrectly: Int = 0;
    var typeOfProblem: MathProblem = MathProblem.Addition;
    
    var additionQuestions: Bool = false;
    var substractionQuestions: Bool = false;
    var multiplicationQuestions: Bool = false;
    
    @IBAction func finishedPress(sender: AnyObject) {
        
        if nextButton.hidden == true {
         
            currentProblemNumber--;
        }
    }
    
    @IBAction func answerPressed(sender: AnyObject) {
        
        let answerButtonPressed = sender as! UIButton;
        
        if answerButtonPressed.tag == problemAnswer {
            
            numberOfProblemsAnsweredCorrectly++;

            runTest();
            
        } else {
            
            nextButton.hidden = false;
            displayCorrectProblemAnswer();
        }
    }
    
    @IBAction func goPressed() {
        outOfLabel.hidden = false;
        goButton.hidden = true;
        problemQuestionLabel.hidden = false;
        showAnswerChoices();
        
        runTest();
    }
    
    @IBAction func nextButtonPressed() {
        
        clearOutBackgroundColors();

        runTest();
        
        nextButton.hidden = true;
    }
    
    func runTest() {

        switch typeOfProblem {
            
        case .Addition:
            runAdditionQuestion();
        case .Subtraction:
            runSubtractionQuestion();
        case .Multiplication:
            runAdditionQuestion();
        }
        
    }
    
    func runAdditionQuestion() {
        
        
        if currentProblemNumber < Int(MAX_PROBLEMS) {
            
            clearOutBackgroundColors();
            
            outOfLabel.text = "\(++currentProblemNumber) out of \(MAX_PROBLEMS)";
            outOfLabel.hidden = false;
            
            //Get the numbers to add together
            let firstNumber: Int  = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
            let secondNumber: Int = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
            
            //Get the correct answer and the wrong answers
            problemAnswer = firstNumber + secondNumber;
            let firstWrongAnswer  = getWrongAnswer();
            let secondWrongAnswer = getWrongAnswer();
            
            problemQuestionLabel.text = "\(firstNumber) + \(secondNumber) = ?";
            
            buildAndShowRightAndWrongAnswers(firstWrongAnswer, secondWrongAnswer: secondWrongAnswer, problemAnswer: problemAnswer);
        }
        else {
            performSegueWithIdentifier("answerSummary", sender: nil)
        }
    }
    
    func runSubtractionQuestion() {
        
        clearOutBackgroundColors();
        
        outOfLabel.text = "\(++currentProblemNumber) out of \(MAX_PROBLEMS)";
        outOfLabel.hidden = false;
        
        //Get the numbers to subtract
        let firstNumber: Int  = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        let secondNumber: Int = Int(arc4random_uniform(UInt32(firstNumber))) + 1;
        
        //Get the correct answer and the wrong answers
        problemAnswer = firstNumber - secondNumber;
        let firstWrongAnswer  = getWrongAnswer();
        let secondWrongAnswer = getWrongAnswer();
        
        problemQuestionLabel.text = "\(firstNumber) - \(secondNumber) = ?";
        
        buildAndShowRightAndWrongAnswers(firstWrongAnswer, secondWrongAnswer: secondWrongAnswer, problemAnswer: problemAnswer);
    }
    
    func buildAndShowRightAndWrongAnswers(firstWrongAnswer: Int, secondWrongAnswer: Int, problemAnswer: Int)
    {
        //Build answer selections
        //These must be randomized so that the correct answer is not always in the same position
        let answerOrder = Int(arc4random_uniform(3)) + 1;
        switch answerOrder {
        case 1:
            
            questionAnswer1.setTitle(String(problemAnswer), forState: .Normal);
            questionAnswer2.setTitle(String(firstWrongAnswer), forState: .Normal);
            questionAnswer3.setTitle(String(secondWrongAnswer), forState: .Normal);
            
            questionAnswer1.tag = Int(problemAnswer);
            questionAnswer2.tag = firstWrongAnswer;
            questionAnswer3.tag = secondWrongAnswer;
            
        case 2:
            
            questionAnswer1.setTitle(String(firstWrongAnswer), forState: .Normal);
            questionAnswer2.setTitle(String(problemAnswer), forState: .Normal);
            questionAnswer3.setTitle(String(secondWrongAnswer), forState: .Normal);
            
            questionAnswer1.tag = firstWrongAnswer;
            questionAnswer2.tag = Int(problemAnswer);
            questionAnswer3.tag = secondWrongAnswer;
            
        case 3:
            
            questionAnswer1.setTitle(String(firstWrongAnswer), forState: .Normal);
            questionAnswer2.setTitle(String(secondWrongAnswer), forState: .Normal);
            questionAnswer3.setTitle(String(problemAnswer), forState: .Normal);
            
            questionAnswer1.tag = firstWrongAnswer;
            questionAnswer2.tag = secondWrongAnswer;
            questionAnswer3.tag = Int(problemAnswer);
            
        default:
            problemQuestionLabel.text = "Error: No Calculations Found";
        }
    }
    
    func getWrongAnswer() -> Int {
        
        var wrongAnswer = 0;
        
        repeat {
            
            wrongAnswer = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
            
        } while wrongAnswer == problemAnswer;
        
        return wrongAnswer;
        
    }
    
    func showAnswerChoices() {
        
        questionAnswer1.hidden = false;
        questionAnswer2.hidden = false;
        questionAnswer3.hidden = false;
        
    }
    
    func clearOutBackgroundColors() {
        
        questionAnswer1.backgroundColor = nil;
        questionAnswer2.backgroundColor = nil;
        questionAnswer3.backgroundColor = nil;
    }
    
    func displayCorrectProblemAnswer() {
        
        if questionAnswer1.tag == problemAnswer {
            questionAnswer1.backgroundColor = UIColor.customGreenColor();
            questionAnswer2.backgroundColor = UIColor.customRedBackground();
            questionAnswer3.backgroundColor = UIColor.customRedBackground();
        }
        else if questionAnswer2.tag == problemAnswer {
            questionAnswer1.backgroundColor = UIColor.customRedBackground();
            questionAnswer2.backgroundColor = UIColor.customGreenColor();
            questionAnswer3.backgroundColor = UIColor.customRedBackground();
        }
        else if questionAnswer3.tag == problemAnswer {
            questionAnswer1.backgroundColor = UIColor.customRedBackground();
            questionAnswer2.backgroundColor = UIColor.customRedBackground();
            questionAnswer3.backgroundColor = UIColor.customGreenColor();
        }
    }
}

extension UIColor
{
    class func customRedBackground() -> UIColor {
        
        return UIColor(red:1.0, green:0.5, blue:0.6, alpha: 0.2);
    }
    
    class func customGreenColor() -> UIColor {
        
        return UIColor(red:0.5, green:1.0, blue:0.5, alpha: 0.2);
    }
}
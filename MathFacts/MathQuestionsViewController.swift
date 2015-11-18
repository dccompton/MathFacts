//
//  AdditionViewControler.swift
//  MathFacts
//
//  Created by David Compton on 11/6/15.
//  Copyright © 2015 David Compton. All rights reserved.
//

import UIKit

class MathQuestionsViewController: UIViewController {
    
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
        
        startOverButton.hidden = true;
        finishedButton.hidden = true;
        
        goButton.hidden = true;

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "answerSummary" {
            let svc = segue.destinationViewController as! SummaryViewController;
            
            svc.numberOfProblemsAnsweredCorrectly = numberOfProblemsAnsweredCorrectly;
            svc.lastProblemNumberAnswered = currentProblemNumber;
            svc.timerPerQuestion = slowestAnswersList;
            svc.timerPerSession = fastestAnswersList;
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
    @IBOutlet weak var startOverButton: UIButton!
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    //Variables
    var problemAnswer: Int = 0;
    var currentProblemNumber: Int = 0;
    var numberOfProblemsAnsweredCorrectly: Int = 0;
    var typeOfProblem: MathProblem = MathProblem.Addition;
    var hardnessLevel: HardnessLevel = HardnessLevel.Easy;
    
    var additionQuestions: Bool = false;
    var substractionQuestions: Bool = false;
    var multiplicationQuestions: Bool = false;
    
    //Per Question Timer
    var timerCountPerQuestion = 0;
    var timerRunningPerQuestion = false;
    var timerPerQuestion = NSTimer();
    
    //Per Session Timer
    var timerCountPerSession = 0;
    var timerRunningPerSession = false;
    var timerPerSession = NSTimer();
    
    var slowestAnswersList = [AnswerStatistic]();
    var fastestAnswersList = [AnswerStatistic]();
    
    @IBAction func hardnessLevel(sender: AnyObject) {
        
        let hardnessLevelButton = sender as! UIButton;
        
        if hardnessLevelButton.tag == 1 {
            
            hardnessLevel = HardnessLevel.Easy;
        }
        else {
            hardnessLevel = HardnessLevel.Hard;
        }
        
        hardButton.hidden = true;
        easyButton.hidden = true;
        goButton.hidden = false;
    }
    
    @IBAction func finishedPress(sender: AnyObject) {
        
        if nextButton.hidden == true {
         
            currentProblemNumber--;
        }
    }
    
    @IBAction func answerPressed(sender: AnyObject) {
        
        let answerButtonPressed = sender as! UIButton;
        
        if answerButtonPressed.tag == problemAnswer {

            stopPerQuestionTimer(true);
            numberOfProblemsAnsweredCorrectly++;

            runMathQuestions();
            
        } else {
            
            nextButton.hidden = false;
            displayCorrectProblemAnswer();
        }
    }
    
    @IBAction func goPressed() {
        outOfLabel.hidden = false;
        goButton.hidden = true;
        problemQuestionLabel.hidden = false;
        
        startOverButton.hidden = false;
        finishedButton.hidden = false;
        
        showAnswerChoices();
        
        runMathQuestions();
    }
    
    @IBAction func nextButtonPressed() {
        
        clearOutBackgroundColors();

        runMathQuestions();
        
        nextButton.hidden = true;
    }
    
    func startPerQuestionTimer() {
        
        if timerRunningPerQuestion == false {
            
            timerCountPerQuestion = 0;
            timerPerQuestion = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("IncrementPerQuestionTimer"), userInfo: nil, repeats: true);
            timerRunningPerQuestion = true;
        }
    }
    
    func stopPerQuestionTimer(problemAnsweredCorrectly: Bool = false) {
        
        if timerRunningPerQuestion == true {
            
            timerPerQuestion.invalidate();
            timerRunningPerQuestion = false;
            
            if problemAnsweredCorrectly {
                
                let statObject = AnswerStatistic();
                statObject.timeToAnswer = timerCountPerQuestion;
                statObject.problemQuestion = problemQuestionLabel.text!;
                
                slowestAnswersList.append(statObject);
                fastestAnswersList.append(statObject);
                
                slowestAnswersList.sortInPlace( { $0.timeToAnswer > $1.timeToAnswer } ); // DESC
                fastestAnswersList.sortInPlace( { $0.timeToAnswer < $1.timeToAnswer } ); // ASC
                
                slowestAnswersList = trimAnswerListStats(slowestAnswersList);
                fastestAnswersList = trimAnswerListStats(fastestAnswersList);
            }
        }
    }
    
    func trimAnswerListStats(var statList: Array<AnswerStatistic>) -> Array<AnswerStatistic> {

        if statList.count > 2 {
            
            let range = Range(start: 2, end: statList.count);
            statList.removeRange(range);
        }
        
        return statList;
    }
    
    func IncrementPerQuestionTimer() {
        
        timerCountPerQuestion++;
    }
    
    func runMathQuestions() {

        
        if currentProblemNumber < Int(MAX_PROBLEMS) {
            
            clearOutBackgroundColors();
            
            outOfLabel.text = "\(++currentProblemNumber) out of \(MAX_PROBLEMS)";
            outOfLabel.hidden = false;
            
            //Get the numbers to add together
            let firstNumber: Int  = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
            var secondNumber: Int = 0;
            
            switch typeOfProblem {
                
            case .Addition:
                secondNumber = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
                problemAnswer = firstNumber + secondNumber;
                problemQuestionLabel.text = "\(firstNumber) + \(secondNumber) = ?";
            case .Subtraction:
                secondNumber = Int(arc4random_uniform(UInt32(firstNumber))) + 1;
                problemAnswer = firstNumber - secondNumber;
                problemQuestionLabel.text = "\(firstNumber) - \(secondNumber) = ?";
            case .Multiplication:
                secondNumber = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
                problemAnswer = firstNumber * secondNumber;
                problemQuestionLabel.text = "\(firstNumber) * \(secondNumber) = ?";
                
            }
            
            //Get the wrong answers
            let firstWrongAnswer  = getWrongAnswer();
            let secondWrongAnswer = getWrongAnswer();
            
            buildAndShowRightAndWrongAnswers(firstWrongAnswer, secondWrongAnswer: secondWrongAnswer, problemAnswer: problemAnswer);
            
            startPerQuestionTimer();
        }
        else {
            performSegueWithIdentifier("answerSummary", sender: nil)
        }
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
        
        if hardnessLevel == HardnessLevel.Hard {

            repeat {
                
                let numberRangeTop: UInt32 = UInt32(problemAnswer) + MAX_NUMBER_RANGE;
                wrongAnswer = Int(arc4random_uniform(numberRangeTop)) + 1;
                
                print("I am here hard");
                print("problemAnswer = \(problemAnswer)");
                print("wrongAnswer = \(wrongAnswer)");
                print("Problem Answer - Variance \(problemAnswer - NUMBER_VARIANCE)");
                print("Problem Answer + Variance \(problemAnswer + NUMBER_VARIANCE)");
                print("=========================");
                
            } while wrongAnswer == problemAnswer || (wrongAnswer < (problemAnswer - NUMBER_VARIANCE) || wrongAnswer > (problemAnswer + NUMBER_VARIANCE))
        }
        else {
            
            repeat {
                
                wrongAnswer = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
                
                print("I is here easy");
                
            } while wrongAnswer == problemAnswer
        }
        
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
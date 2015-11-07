//
//  ViewController.swift
//  MathFacts
//
//  Created by David Compton on 11/1/15.
//  Copyright © 2015 David Compton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Costants
    let MAX_NUMBER_RANGE: UInt32 = 10;
    let MAX_PROBLEMS: Int = 100;
    
    //Variables
    var problemAnswer: Int = 0;
    var currentProblemNumber: Int = 1;
    var numberOfProblemsAnsweredCorrectly: Int = 0;
    
    //IBOutlets
//    @IBOutlet weak var imageBackground: UIImageView!;
//    @IBOutlet weak var outOfLabel: UILabel!;
//    @IBOutlet weak var answerSumLabel: UILabel!;
//    @IBOutlet weak var playAgainButton: UIButton!;
    @IBOutlet weak var imageLogo: UIImageView!;
    
//    @IBOutlet weak var questionLabel: UILabel!;
//    @IBOutlet weak var questionAnswer1: UIButton!;
//    @IBOutlet weak var questionAnswer2: UIButton!;
//    @IBOutlet weak var questionAnswer3: UIButton!;
    
    @IBOutlet weak var additionButton: UIButton!;
    @IBOutlet weak var subtractionButton: UIButton!;
    @IBOutlet weak var multiplicationButton: UIButton!
    
    
//    @IBOutlet weak var nextButton: UIButton!;
//    @IBOutlet weak var doneButton: UIButton!;
    
    
//    @IBAction func playAgainButtonPressed() {
//
//        answerSumLabel.hidden = true;
//        playAgainButton.hidden = true;
//        
//        additionButton.hidden = false;
//        subtractionButton.hidden = false;
//        
//        //Reset the counters
//        problemAnswer = 0;
//        currentProblemNumber = 1;
//        numberOfProblemsAnsweredCorrectly = 0;
//        
//    }
    
//    @IBAction func nextButtonPressed() {
//        
//        clearOutBackgroundColors();
//        runAdditionQuestion();
//        
//        nextButton.hidden = true;
//    }
    
    
//    @IBAction func typeOfPlayButtonPressed(sender: AnyObject) {
//        
//        additionButton.hidden = true;
//        subtractionButton.hidden = true;
////        doneButton.hidden = false;
//        
//        let buttonPressed = sender as! UIButton;
//        
//        if buttonPressed.tag == 1 {
//            runAdditionQuestion();
//        }
//        else if buttonPressed.tag == 2 {
//            computeSubtractionFact();
//        }
//        else if buttonPressed.tag == 3 {
//            
//        }
//        
//    }
    
    @IBAction func answerPressed(sender: AnyObject) {
        
        let answerButtonPressed = sender as! UIButton;
        
        currentProblemNumber += 1;
        
        if answerButtonPressed.tag == problemAnswer {
            
            numberOfProblemsAnsweredCorrectly += 1;
            runAdditionQuestion();
            
        } else {
            
            //nextButton.hidden = false;
//            displayCorrectProblemAnswer();
        }
    }
    
//    @IBAction func doneButtonPressed() {
//        
//        answerSumLabel.text = "\(numberOfProblemsAnsweredCorrectly) right, \(currentProblemNumber - numberOfProblemsAnsweredCorrectly) wrong, out of \(currentProblemNumber)";
//        
//        outOfLabel.hidden = true;
//        
//        answerSumLabel.hidden = false;
//        playAgainButton.hidden = false;
//        
//        questionLabel.hidden = true;
//        questionAnswer1.hidden = true;
//        questionAnswer2.hidden = true;
//        questionAnswer3.hidden = true;
//        
//        outOfLabel.hidden = true;
//        
//        clearOutBackgroundColors();
//    }
    
//    func clearOutBackgroundColors() {
//        
//        questionAnswer1.backgroundColor = nil;
//        questionAnswer2.backgroundColor = nil;
//        questionAnswer3.backgroundColor = nil;
//    }
    
//    func displayCorrectProblemAnswer() {
//        
//        if questionAnswer1.tag == problemAnswer {
//            questionAnswer1.backgroundColor = UIColor.greenColor();
//            questionAnswer2.backgroundColor = UIColor.redColor();
//            questionAnswer3.backgroundColor = UIColor.redColor();
//        }
//        else if questionAnswer2.tag == problemAnswer {
//            questionAnswer1.backgroundColor = UIColor.redColor();
//            questionAnswer2.backgroundColor = UIColor.greenColor();
//            questionAnswer3.backgroundColor = UIColor.redColor();
//        }
//        else if questionAnswer3.tag == problemAnswer {
//            questionAnswer1.backgroundColor = UIColor.redColor();
//            questionAnswer2.backgroundColor = UIColor.redColor();
//            questionAnswer3.backgroundColor = UIColor.greenColor();
//        }
//    }
    
    func runAdditionQuestion() {
        
//        clearOutBackgroundColors();
        
//        outOfLabel.text = "\(currentProblemNumber) out of \(MAX_PROBLEMS)";
//        outOfLabel.hidden = false;
        
        //Get the numbers to add together
        let firstNumber: Int  = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        let secondNumber: Int = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        
        //Get the correct answer and the wrong answers
        problemAnswer = firstNumber + secondNumber;
        let firstWrongAnswer  = getWrongAnswer();
        let secondWrongAnswer = getWrongAnswer();
        
//        questionLabel.text = "\(firstNumber) + \(secondNumber) = ?";
        
        //Build answer selections
        //These must be randomized so that the correct answer is not always in the same position
        let answerOrder = Int(arc4random_uniform(3)) + 1;
        switch answerOrder {
        case 1:
            
//            questionAnswer1.setTitle(String(problemAnswer), forState: .Normal);
//            questionAnswer2.setTitle(String(firstWrongAnswer), forState: .Normal);
//            questionAnswer3.setTitle(String(secondWrongAnswer), forState: .Normal);
//            
//            questionAnswer1.tag = Int(problemAnswer);
//            questionAnswer2.tag = firstWrongAnswer;
//            questionAnswer3.tag = secondWrongAnswer;
            
            showAnswerChoices();
            
        case 2:
            
//            questionAnswer1.setTitle(String(firstWrongAnswer), forState: .Normal);
//            questionAnswer2.setTitle(String(problemAnswer), forState: .Normal);
//            questionAnswer3.setTitle(String(secondWrongAnswer), forState: .Normal);
//            
//            questionAnswer1.tag = firstWrongAnswer;
//            questionAnswer2.tag = Int(problemAnswer);
//            questionAnswer3.tag = secondWrongAnswer;
            
            showAnswerChoices();
            
        case 3:
            
//            questionAnswer1.setTitle(String(firstWrongAnswer), forState: .Normal);
//            questionAnswer2.setTitle(String(secondWrongAnswer), forState: .Normal);
//            questionAnswer3.setTitle(String(problemAnswer), forState: .Normal);
//            
//            questionAnswer1.tag = firstWrongAnswer;
//            questionAnswer2.tag = secondWrongAnswer;
//            questionAnswer3.tag = Int(problemAnswer);
            
            showAnswerChoices();
            
        default:
//            questionLabel.text = "Error: No Calculations Found";
            
            showAnswerChoices();
        }

    }
    
    func showAnswerChoices() {
        
//        questionLabel.hidden = false;
//        questionAnswer1.hidden = false;
//        questionAnswer2.hidden = false;
//        questionAnswer3.hidden = false;
        
    }
    
    func getWrongAnswer() -> Int {
        
        var wrongAnswer = 0;
        
        repeat {
            
            wrongAnswer = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
            
        } while wrongAnswer == problemAnswer;
        
        return wrongAnswer;
        
    }
    
    func computeSubtractionFact() {
        
    }

}


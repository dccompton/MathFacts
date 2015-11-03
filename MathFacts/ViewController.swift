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
    
    //IBOutlets
    @IBOutlet weak var imageBackground: UIImageView!;
    @IBOutlet weak var outOfLabel: UILabel!;
    @IBOutlet weak var imageLogo: UIImageView!;
    @IBOutlet weak var playButton: UIButton!;
    
    @IBOutlet weak var questionLabel: UILabel!;
    @IBOutlet weak var questionAnswer1: UIButton!;
    @IBOutlet weak var questionAnswer2: UIButton!;
    @IBOutlet weak var questionAnswer3: UIButton!;
    
    @IBOutlet weak var additionButton: UIButton!;
    @IBOutlet weak var orLabel: UILabel!;
    @IBOutlet weak var subtractionButton: UIButton!;
    
    @IBOutlet weak var testButton: UIButton!;
    
    @IBOutlet weak var restartButton: UIButton!;
    
    @IBAction func testButtonPressed() {
        
        runAdditionQuestion();
    }
    
    @IBAction func playButtonPressed() {
        
        additionButton.hidden = false;
        orLabel.hidden = false;
        subtractionButton.hidden = false;
        
        playButton.hidden = true;
        
        restartButton.hidden = false;
        
    }
    
    @IBAction func test() {
        
        runAdditionQuestion();
        
    }
    
    @IBAction func typeOfPlayButtonPressed(sender: AnyObject) {
        
        additionButton.hidden = true;
        orLabel.hidden = true;
        subtractionButton.hidden = true;
        
        let buttonPressed = sender as! UIButton;
        
        if buttonPressed.tag == 1 {
            runAdditionQuestion();
        }
        else if buttonPressed.tag == 2 {
            computeSubtractionFact();
        }
        
    }
    
    @IBAction func answerPressed(sender: AnyObject) {
        
    }
    
    func runAdditionQuestion() {
        
        //Get the numbers to add together
        let firstNumber: Int  = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        let secondNumber: Int = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        
        //Get the correct answer and the wrong answers
        problemAnswer = firstNumber + secondNumber;
        let firstWrongAnswer  = getWrongAnswer();
        let secondWrongAnswer = getWrongAnswer();
        
        questionLabel.text = "\(firstNumber) + \(secondNumber) = ?";
        
        //Build answer selections
        //These must be randomized so that the correct answer is not always in the same position
        let answerOrder = Int(arc4random_uniform(3)) + 1;
        switch answerOrder {
        case 1:
            
            questionAnswer1.setTitle(String(problemAnswer.value), forState: .Normal);
            questionAnswer2.setTitle(String(firstWrongAnswer), forState: .Normal);
            questionAnswer3.setTitle(String(secondWrongAnswer), forState: .Normal);
            
            questionAnswer1.tag = problemAnswer;
            questionAnswer2.tag = firstWrongAnswer;
            questionAnswer3.tag = secondWrongAnswer;
            
        case 2:
            
            questionAnswer1.setTitle(String(firstWrongAnswer), forState: .Normal);
            questionAnswer2.setTitle(String(problemAnswer.value), forState: .Normal);
            questionAnswer3.setTitle(String(secondWrongAnswer), forState: .Normal);
            
            questionAnswer1.tag = firstWrongAnswer;
            questionAnswer2.tag = problemAnswer;
            questionAnswer3.tag = secondWrongAnswer;
            
        case 3:
            
            questionAnswer1.setTitle(String(firstWrongAnswer), forState: .Normal);
            questionAnswer2.setTitle(String(secondWrongAnswer), forState: .Normal);
            questionAnswer3.setTitle(String(problemAnswer.value), forState: .Normal);
            
            questionAnswer1.tag = firstWrongAnswer;
            questionAnswer2.tag = secondWrongAnswer;
            questionAnswer3.tag = problemAnswer;
            
        default:
            questionLabel.text = "Error: No Calculations Found";
        }

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
    
    func restartMathFacts() {
        
        questionLabel.hidden = true;
        questionAnswer1.hidden = true;
        questionAnswer2.hidden = true;
        questionAnswer3.hidden = true;
        
        
        
        
    }
}


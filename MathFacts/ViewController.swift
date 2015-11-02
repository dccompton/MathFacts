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
    
    @IBOutlet weak var restartButton: UIButton!;
    
    @IBAction func playButtonPressed() {
        
        additionButton.hidden = false;
        orLabel.hidden = false;
        subtractionButton.hidden = false;
        
        playButton.hidden = true;
        
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
        
        var firstNumber: Int = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        var secondNumber: Int = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        problemAnswer = firstNumber + secondNumber;
        
        questionLabel.text = "\(firstNumber) + \(secondNumber) = ?";
        
        //Build answer selections
        var answerOrder = Int(arc4random_uniform(3)) + 1;
        
        switch answerOrder {
        case 1:
            questionAnswer1.titleLabel.text = (String)problemAnswer;
            questionAnswer2.titleLabel.text = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
            questionAnswer3.titleLabel.text = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        case 2:
            questionAnswer1.titleLabel.text = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
            questionAnswer2.titleLabel.text = problemAnswer
            questionAnswer3.titleLabel.text = Int(arc4random_uniform(MAX_NUMBER_RANGE)) + 1;
        }
        
        questionAnswer1.titleLabel.text = Int(arc4random_uniform(19));
        questionAnswer2.titleLabel.text = Int(arc4random_uniform(19));
        questionAnswer3.titleLabel.text = Int(arc4random_uniform(19));

    }
    
    func computeSubtractionFact() {
        
    }
}


//
//  ViewController.swift
//  MathFacts
//
//  Created by David Compton on 11/1/15.
//  Copyright © 2015 David Compton. All rights reserved.
//

import UIKit

enum MathProblem {
    
    case Addition
    case Subtraction
    case Multiplication
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "questionGame" {
            let svc = segue.destinationViewController as! AdditionViewController;
            
            svc.additionQuestions = true;
            
            let buttonPressed = sender as! UIButton;
            
            if buttonPressed.tag == 1 {
                svc.typeOfProblem = MathProblem.Addition;
            }
            else if buttonPressed.tag == 2 {
                svc.typeOfProblem = MathProblem.Subtraction;
            }
            else if buttonPressed.tag == 3 {
                svc.typeOfProblem = MathProblem.Multiplication;
            }
            
        }
    }
    
    //IBOutlets
    @IBOutlet weak var imageLogo: UIImageView!;
    @IBOutlet weak var additionButton: UIButton!;
    @IBOutlet weak var subtractionButton: UIButton!;
    @IBOutlet weak var multiplicationButton: UIButton!
    

}


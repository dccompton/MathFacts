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
    
    //IBOutlets
    @IBOutlet weak var imageBackground: UIImageView!;
    @IBOutlet weak var imageLogo: UIImageView!;
    @IBOutlet weak var playButton: UIButton!;
    
    @IBOutlet weak var questionLable: UILabel!;
    @IBOutlet weak var quesionAnswer1: UIButton!;
    @IBOutlet weak var quesionAnswer2: UIButton!;
    @IBOutlet weak var quesionAnswer3: UIButton!;
    
    @IBOutlet weak var additionButton: UIButton!;
    @IBOutlet weak var orLabel: UILabel!;
    @IBOutlet weak var subtractionButton: UIButton!;
    
    @IBAction func playButtonPressed() {
        
    }
    
    @IBAction func typeOfPlayButtonPressed(sender: AnyObject) {
        
    }
    
    @IBAction func answerPressed(sender: AnyObject) {
        
    }
    
    func getRandomNum() -> Int {
        return 0;
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}


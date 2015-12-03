//
//  ViewController.swift
//  calcApp
//
//  Created by Vu Dang on 12/1/15.
//  Copyright © 2015 Vu Dang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    
    enum Operation: String
    {
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case Equals = "="
        case Empty = "Empty"
    }
    
    //IBOutlets
    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!;
    var runningNumber = ""
    var rightNumValue = ""
    var leftNumValue = ""
    var currentOperation: Operation = Operation.Empty;
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("newGlassSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do
        {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL);
            btnSound.prepareToPlay();
        }
        catch let err as NSError
        {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(btn: UIButton!)
    {
        btnSound.play();
        runningNumber += "\(btn.tag)";
        outputLbl.text = runningNumber;
        
    }

    @IBAction func onAddPressed(sender: AnyObject)
    {
        btnSound.play();
        currentOperation = Operation.Add;
    }

    @IBAction func onSubtractPressed(sender: AnyObject)
    {
        btnSound.play();
        currentOperation = Operation.Subtract;
    }

    @IBAction func onMultiplyPressed(sender: AnyObject)
    {
        btnSound.play();
        currentOperation = Operation.Multiply;
    }
    
    @IBAction func onDividePressed(sender: AnyObject)
    {
        btnSound.play();
        currentOperation = Operation.Divide;
    }
    
    @IBAction func onEqualPressed(sender: AnyObject)
    {
        btnSound.play();
        currentOperation = Operation.Equals;
    }
    
}


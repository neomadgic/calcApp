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
        case Empty = "Empty"
    }
    
    //IBOutlets
    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!;
    var runningNumber = ""
    var rightNumStr = ""
    var leftNumStr = ""
    var currentOperation: Operation = Operation.Empty;
    var result = ""
    
    
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
        playSound()
        runningNumber += "\(btn.tag)";
        outputLbl.text = runningNumber;
        
    }

    @IBAction func onAddPressed(sender: AnyObject)
    {
        processOperation(Operation.Add);
    }

    @IBAction func onSubtractPressed(sender: AnyObject)
    {
        processOperation(Operation.Subtract);
    }

    @IBAction func onMultiplyPressed(sender: AnyObject)
    {
        processOperation(Operation.Multiply);
    }
    
    @IBAction func onDividePressed(sender: AnyObject)
    {
        processOperation(Operation.Divide);
    }
    
    @IBAction func onEqualPressed(sender: AnyObject)
    {
        processOperation(currentOperation);
        resetNumStr();
    }
    
    @IBAction func onClearPressed(sender: AnyObject)
    {
        playSound();
        resetNumStr();
        outputLbl.text = "0";
    }
    
    func processOperation(op: Operation)
    {
        playSound()
        if(currentOperation != Operation.Empty)
            {
            if runningNumber != "" && leftNumStr != ""
                {
                rightNumStr = runningNumber;
                    
                if currentOperation == Operation.Add
                    {
                        result = "\(Double(leftNumStr)! + Double(rightNumStr)!)"
                    }
                else if currentOperation == Operation.Subtract
                    {
                        result = "\(Double(leftNumStr)! - Double(rightNumStr)!)"
                    }
                else if currentOperation == Operation.Multiply
                    {
                        result = "\(Double(leftNumStr)! * Double(rightNumStr)!)"
                    }
                else if currentOperation == Operation.Divide
                    {
                        result = "\(Double(leftNumStr)! / Double(rightNumStr)!)"
                    }
                runningNumber = "";
                leftNumStr = result;
                outputLbl.text = result;
                currentOperation = op;
                }
            }
        else
            {
            leftNumStr = runningNumber;
            runningNumber = "";
            //currentOperation = op;
            }
        currentOperation = op;
    }
    
    func playSound()
    {
        
        if btnSound.playing
            {
            btnSound.stop();
            }
        
        btnSound.play();
    }
    
    func resetNumStr()
    {
        leftNumStr = "";
        rightNumStr = "";
        runningNumber = "";
        currentOperation = Operation.Empty;
    }
    
}


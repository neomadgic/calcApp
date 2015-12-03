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
    
    //IBOutlets
    @IBOutlet weak var outputLbl: UILabel!
    var numX = 0;
    
    var btnSound: AVAudioPlayer!;
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("glassSound", ofType: "wav")
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
        outputLbl.text = "\(numX + 1)"
        numX += 1;
        
    }



}


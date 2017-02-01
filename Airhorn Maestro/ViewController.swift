//
//  ViewController.swift
//  Airhorn Maestro
//
//  Created by David Krystall on 1/20/17.
//  Copyright © 2017 David Krystall. All rights reserved.
//

import UIKit
import AVFoundation
import AudioUnit

class ViewController: UIViewController {
    
    var audioEngine : AudioSingleton!
    var toggle = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        audioEngine = AudioSingleton(componentType: kAudioUnitType_Effect)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        self.toggle = !self.toggle
        if let view = sender.view{
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        if toggle{
            audioEngine.startPlaying()
        } else {
            audioEngine.stopPlaying()
        }
    }

}


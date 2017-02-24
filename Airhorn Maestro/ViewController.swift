//
//  ViewController.swift
//  Airhorn Extreme
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
    var pitch:Float?
    var rate:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pitch = 1
        audioEngine = AudioSingleton(componentType: kAudioUnitType_Effect)
        if let airPitch = self.pitch{
            self.audioEngine.adjustPitch(pitch: airPitch, rate: 2)
        }
        if let airRate = self.rate{
            self.audioEngine.adjustPitch(pitch: pitch!, rate: airRate)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loopButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func singleButtonPressed(_ sender: Any) {
        
    }

    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        self.toggle = !self.toggle
        if let view = sender.view{
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
        //audioEngine.startPlaying()
        if toggle{
            audioEngine.startPlaying()
        } else {
            audioEngine.stopPlaying()
        }
    }
    
    @IBOutlet var rateSlider: UISlider!
    @IBOutlet var frequencySlider: UISlider!
    @IBAction func sliderChanged(_ sender: UISlider) {
        self.pitch = self.frequencySlider.value
        
        if let airPitch = self.pitch{
            self.audioEngine.adjustPitch(pitch: airPitch, rate: 2)
        }
    }
    
    @IBAction func rateSlider(_ sender: UISlider) {
        self.rate = self.rateSlider.value
        if let airRate = self.rate{
            self.audioEngine.adjustPitch(pitch: pitch!, rate: airRate)
        }
        
    }
}


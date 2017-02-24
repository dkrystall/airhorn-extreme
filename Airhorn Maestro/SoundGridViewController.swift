//
//  SoundGridViewController.swift
//  Airhorn Maestro
//
//  Created by David Krystall on 2/24/17.
//  Copyright © 2017 David Krystall. All rights reserved.
//

import UIKit

class SoundGridViewController: UIViewController {

    var audioEngine : AudioSingleton!
    var toggle = false
    var pitch:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isMultipleTouchEnabled = true
        self.view.isUserInteractionEnabled = true
//        super.view.isUserInteractionEnabled = true
//        for view in self.view.subviews{
//            view.isUserInteractionEnabled = false
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first?.location(in: self.view)
        if let yValue = touch?.y{
            let yFloat = Float(yValue)
            print("Floating point value for y is: \(yFloat)")
            pitch = yFloat
        }
        print(touch ?? "touch not found")
        print(pitch?.description ?? "float not found")
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ended")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("touches movied")
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touches cancelled")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

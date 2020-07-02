//
//  ViewController.swift
//  BrockTherapy
//
//  Created by Vihara Girihagama on 6/24/20.
//  Copyright © 2020 Vihara Girihagama. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet weak var holdButton: UIButton! //The Button we need to hold
    @IBOutlet weak var holdTimeLabel: UILabel! // The label which shows the time
    
    var timer: Timer? // The timer
    var holdingTime = 10 // The time left to hold
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Code to make the button round
        
        holdButton.layer.cornerRadius = holdButton.bounds.size.width / 2
        holdButton.layer.borderWidth = 1.0
        holdButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        holdButton.clipsToBounds = true
        
    }
    
    @IBAction func buttonDown(_ sender: UIButton) {  //When the user starts to press the button
        buttonTouch()   // Trigger this once
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(buttonHold), userInfo: nil, repeats: true)   //Make a timer that will repeat function 'buttonHold'
        holdButton.titleLabel?.text = "Hold the 'X'"  //Change the text of the button
    }
    
    @IBAction func buttonUp(_ sender: UIButton) {  // When the user lifts his/her finger from the button...
        holdTimeLabel.alpha = 0  // Make the Label dissapear (Transparent)
        timer?.invalidate()  // Invalidate (Cancel) the timer
        holdButton.titleLabel?.text = "Ready.."  //Change the text of the button
        
        }
    
    
    func buttonTouch() {  // Resets evetything and stuff
        
        holdTimeLabel.alpha = 1  //Label can be seen...
        holdTimeLabel.text = "10"  //...with this content
        holdingTime = 10  //Reset holding time to 10
    }
    
    @objc func buttonHold() {
        if holdingTime > 1 {  //Logically, having this instead of > 0 makes sense if we only want to work it for 10 seconds
            holdingTime -= 1
            holdTimeLabel.text = String(holdingTime)  //text of the hold Time label = the holding time
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))  //Vibrate device (Does not show on simulator/iPad)
            holdButton.titleLabel?.text = "Done!"  //Change the text of the button
            holdTimeLabel.alpha = 0  //makes the label invisible
            timer?.invalidate()  //cancel timer
            
        }
    }
    
    
}


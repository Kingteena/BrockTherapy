//
//  ViewController.swift
//  BrockTherapy
//
//  Created by Vihara Girihagama on 6/24/20.
//  Copyright © 2020 Vihara Girihagama. All rights reserved.
//

import UIKit
import AudioToolbox

class HoldViewController: UIViewController {
    
    @IBOutlet weak var holdButton: UIButton! //The Button we need to hold
    @IBOutlet weak var holdTimeLabel: UILabel! // The label which shows the time
    @IBOutlet weak var stareTimeLabel: UILabel!
    
    
    var holdTimer: Timer? // The timer
    var stareTimer: Timer?
    var holdingTime = 10 // The time left to hold
    var stareTimeSecond = 0
    var stareToBeStarted = true
    var stareTimeMinute : Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Code to make the button round
        
        holdButton.layer.cornerRadius = holdButton.bounds.size.width / 2
        holdButton.layer.borderWidth = 1.0
        holdButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        holdButton.clipsToBounds = true
        holdButton.titleLabel?.textAlignment = .center
        
        stareTimeLabel.text = "Press the button to start"    //Test code to make sure it works
        holdButton.setTitle("Ready..", for: .normal)  //Change the text of the button

    }
    
    @IBAction func buttonDown(_ sender: UIButton) {  //When the user starts to press the button
        if stareToBeStarted{
            stareToBeStarted = false
            self.stareTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
        }
        buttonTouch()   // Trigger this once
        holdButton.setTitle("Hold the 'X'", for: .normal) //Change the text of the button
        holdTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(buttonHold), userInfo: nil, repeats: true)   //Make a timer that will repeat function 'buttonHold'
    }
    
    @IBAction func buttonUp(_ sender: UIButton) {  // When the user lifts his/her finger from the button...
        holdTimeLabel.alpha = 0  // Make the Label dissapear (Transparent)
        holdTimer?.invalidate()  // Invalidate (Cancel) the timer
         //Change the text of the button
        holdButton.setTitle("Ready..", for: .normal)
    }
    
    
    func buttonTouch() {  // Resets evetything and stuff
        
        holdTimeLabel.alpha = 1  //Label can be seen...
        holdTimeLabel.text = "10"  //...with this content
        holdButton.setTitle("Hold the 'X'", for: .normal)  //Change the text of the button
        holdingTime = 10  //Reset holding time to 10
        holdTimer?.invalidate()
    }
    
    @objc func buttonHold() {
        if holdingTime > 1 {  //Logically, having this instead of > 0 makes sense if we only want to work it for 10 seconds
            holdingTime -= 1
            holdTimeLabel.text = String(holdingTime)  //text of the hold Time label = the holding time

        } else {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))  //Vibrate device (Does not show on simulator/iPad)
            holdButton.setTitle("Done", for: .normal)  //Change the text of the button
            holdTimeLabel.alpha = 0  //makes the label invisible
            holdTimer?.invalidate()  //cancel timer
            
        }
    }
    @objc func countDown(){
        
        if stareTimeSecond > 0 {
            stareTimeSecond -= 1
        }else if stareTimeSecond == 0 && stareTimeMinute == 0{
            print("Done")
        }else{
            stareTimeMinute! -= 1
            stareTimeSecond = 59
        }
        if stareTimeMinute == 0{
            stareTimeLabel.text = "\(stareTimeSecond) seconds left"
        }else{
            stareTimeLabel.text = "\(stareTimeMinute!) minutes and \(stareTimeSecond) seconds left"
        }
    }
}


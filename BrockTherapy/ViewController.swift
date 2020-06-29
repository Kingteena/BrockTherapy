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
    
    @IBOutlet weak var holdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        holdButton.layer.cornerRadius = 150
        holdButton.layer.borderWidth = 1.0
        holdButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        holdButton.clipsToBounds = true
        
        
       let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
       recognizer.minimumPressDuration = 2.0 // Duration
       holdButton.addGestureRecognizer(recognizer)

            
    }
        
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }

    }

}


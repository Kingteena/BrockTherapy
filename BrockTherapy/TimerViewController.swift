//
//  TimerViewController.swift
//  BrockTherapy
//
//  Created by Vihara Girihagama on 7/26/20.
//  Copyright © 2020 Vihara Girihagama. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "TimerToHold", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = HoldViewController()
        destinationVC.stareTimeMinute = Int(timePicker.countDownDuration)/60
    }
}

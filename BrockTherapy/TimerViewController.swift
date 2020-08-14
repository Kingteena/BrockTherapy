//
//  TimerViewController.swift
//  BrockTherapy
//
//  Created by Vihara Girihagama on 7/26/20.
//  Copyright © 2020 Vihara Girihagama. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var stareTimePicker: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    var pickableMinutes: [Int]{
        get{
            var numbers = [Int]()
            for i in 1...20{
                numbers.append(i)
            }
            return numbers
        }
    }
    @IBAction func doneButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "TimerToHold", sender: self)

    }
    
    override func viewDidLoad() {
        stareTimePicker.delegate = self
        stareTimePicker.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! HoldViewController
        destinationVC.stareTimeMinute = pickableMinutes[stareTimePicker.selectedRow(inComponent: 0)]
    }
}

extension TimerViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        20
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickableMinutes[row])
    }
    
}

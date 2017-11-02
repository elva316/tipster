//
//  ViewController.swift
//  tipster
//
//  Created by elva wang on 11/1/17.
//  Copyright © 2017 elva wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var smallPercent: UILabel!
    @IBOutlet weak var mediumPercent: UILabel!
    @IBOutlet weak var largePercent: UILabel!
    
    @IBOutlet weak var smallTip: UILabel!
    @IBOutlet weak var mediumTip: UILabel!
    @IBOutlet weak var largeTip: UILabel!
    
    @IBOutlet weak var smallTotal: UILabel!
    @IBOutlet weak var mediumTotal: UILabel!
    @IBOutlet weak var largeTotal: UILabel!
    
    var inputN: String = ""
    @IBOutlet weak var inputLabelPressed: UILabel!
    @IBAction func inputNum(_ sender: UIButton) {
        if inputLabelPressed.text == String(0) {
            inputLabelPressed.text = String(sender.tag)
        } else if sender.tag == 11 {
            inputLabelPressed.text = inputLabelPressed.text! + "."
        } else {
            inputLabelPressed.text = inputLabelPressed.text! + String(sender.tag)
            print(sender.tag, "yyyyyyyyyyyyyy")
        }
    }
    
    @IBAction func percentSlider(_ sender: UISlider) {
        print("percent slider is working \( Int(sender.value))")
        smallPercent.text = String(round(sender.value)) + "%"
        mediumPercent.text = String(round(sender.value)+5) + "%"
        largePercent.text = String(round(sender.value)+10) + "%"
        
        smallTip.text = inputLabelPressed.text
        if let x = inputLabelPressed.text {
            let x = Double(x)
            let tip = Double(round(sender.value))
            let group = Double(sizeLabel.text!)

            smallTip.text = String((round((x! * (tip/100)/group!)*100)/100))
            mediumTip.text = String((round((x! * ((tip+5)/100)/group!)*100)/100))
            largeTip.text = String((round((x! * ((tip+10)/100)/group!)*100)/100))
            
            smallTotal.text = String(Double(smallTip.text!)! + x!)
            mediumTotal.text = String(Double(mediumTip.text!)! + x!)
            largeTotal.text = String(Double(largeTip.text!)! + x!)
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        inputLabelPressed.text = "0"
        smallTip.text = "0.00"
        mediumTip.text = "0.00"
        largeTip.text = "0.00"
        smallTotal.text = "0.00"
        mediumTotal.text = "0.00"
        largeTotal.text = "0.00"
    }
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBAction func groupSizeLabel(_ sender: UISlider) {
        print("slider working xxxxxxxx, the value is \(Int(sender.value))")
        let sizeCurrentValue = Int(sender.value)
        sizeLabel.text = "\(sizeCurrentValue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sizeLabel.text = "1"
    }

}


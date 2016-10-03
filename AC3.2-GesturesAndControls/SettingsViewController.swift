//
//  SettingsViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Jason Gresh on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var colorSliderRed: UISlider!
    @IBOutlet weak var colorSliderGreen: UISlider!
    @IBOutlet weak var colorSliderBlue: UISlider!
    @IBOutlet weak var rightWrongLabel: UISegmentedControl!
    @IBOutlet weak var previewFrame: UIView!
    @IBOutlet weak var switchToggle: UISwitch!
    @IBOutlet weak var colorStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gvc = segue.destination as? GesturesViewController {
            gvc.correctColorValue = Double(colorSliderRed.value)
            
            
            //
            //        func choice(_ segment: UISegmentedControl) {
            //            switch segment.selectedSegmentIndex {
            //            case 0:
            //                rightWrongLabel.selectedSegmentIndex = 0
            //            case 1:
            //                rightWrongLabel.selectedSegmentIndex = 1
            //            default:
            //                rightWrongLabel.selectedSegmentIndex = 0
            //            }
            //        }
            
        }
    }
    
    let gestures = GesturesViewController()
    
    @IBAction func rightWrong(_ sender: AnyObject) {
        //        if gestures.currentActionGesture == gestures.pickRandomActionGesture() {
        if gestures.view.backgroundColor == UIColor.red {
            self.rightWrongLabel.selectedSegmentIndex = UISegmentedControlSegment.right.rawValue
            //            UISegmentedControlSegment.sendActionsForControlEvents(UIControlEvents.valueChanged)
            //            rightWrongLabel.addTarget(self, action: #selector(ViewController.segmentedValueChanged(_:)), for: .ValueChanged)
            //        } else {
            //            self.rightWrongLabel.selectedSegmentIndex = 0
            //            
        }
    }
    
    

    @IBAction func sliderChange(_ sender: UISlider) {
//         gestures.view.backgroundColor = UIColor(red: CGFloat(colorSliderRed.value), green: CGFloat(colorSliderGreen.value), blue: CGFloat(colorSliderBlue.value), alpha: 1.0)
        
        previewFrame.backgroundColor = UIColor(red: CGFloat(colorSliderRed.value), green: CGFloat(colorSliderGreen.value), blue: CGFloat(colorSliderBlue.value), alpha: 1.0)
    }
    
    
    @IBAction func onOff(_ sender: UISwitch) {
        if switchToggle.isOn == false {
//            gestures.currentScore = 0
//            gestures.view.backgroundColor = UIColor.red
            view.backgroundColor = UIColor.white
        } else if switchToggle.isOn == true {
            view.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func stepperRounds(_ sender: UIStepper) {
    }
}


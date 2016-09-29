//
//  GestureViewController.swift
//  GesturesAndControls
//
//  Created by Louis Tur on 9/28/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

enum ActionGesture: Int {
    case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
}

class GestureViewController: UIViewController {

    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var actionToPerformLabel: UILabel!
    
    internal var currentActionGesture: ActionGesture! {
        willSet {
            self.updateLabel(for: newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // maybe omit this entirely for simplicity
        tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
        
        self.currentActionGesture = self.pickRandomActionGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateLabel(for actionGes: ActionGesture) {
        var updateText: String = ""
        switch actionGes {
        case .tap: updateText = "tap"
        case .doubleTap: updateText = "double tap"
        case .twoFingerTap: updateText = "two finger tap"
        case .leftSwipe: updateText = "swift left"
        case .rightSwipe: updateText = "swipe right"
        }
        
        self.actionToPerformLabel.text = updateText
    }
    
    func pickRandomActionGesture() -> ActionGesture {
        let randomInt = Int(arc4random_uniform(4)) // number between 0-4
        return ActionGesture.init(rawValue: randomInt) ?? .tap
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("Heck yea I was tapped")
        if self.currentActionGesture == .tap {
            self.currentActionGesture = pickRandomActionGesture()
        }
    }
    
    @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
        print("double tap!")
        if self.currentActionGesture == .doubleTap {
            self.currentActionGesture = pickRandomActionGesture()
        }
    }
    
    @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
        print("two finger tap!")
        if self.currentActionGesture == .twoFingerTap {
            self.currentActionGesture = pickRandomActionGesture()
        }
    }
    
    @IBAction func didLeftSwipe(_ sender: UISwipeGestureRecognizer) {
        print("did swipe left")
        if self.currentActionGesture == .leftSwipe {
            self.currentActionGesture = pickRandomActionGesture()
        }
    }
    
    @IBAction func didRightSwipe(_ sender: AnyObject) {
        print("did swipe right")
        if self.currentActionGesture == .rightSwipe {
            self.currentActionGesture = pickRandomActionGesture()
        }
    }
}

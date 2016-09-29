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
    @IBOutlet weak var scoreLabel: UILabel!
    
    internal var currentActionGesture: ActionGesture! {
        willSet {
            self.updateLabel(for: newValue)
        }
    }
    
    internal var currentScore: Int = 0 {
        willSet {
            self.scoreLabel.text = "Score: \(newValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
        
        self.currentActionGesture = self.pickRandomActionGesture()
        self.scoreLabel.text = "Score: 0"
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
        let randomInt = Int(arc4random_uniform(5)) // number between 0-4
        return ActionGesture.init(rawValue: randomInt) ?? .tap
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("Heck yea I was tapped")
        if self.currentActionGesture == .tap {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.green
            self.currentScore += 1
        } else {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.red
            self.currentScore = 0
        }
    }
    
    @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
        print("double tap!")
        if self.currentActionGesture == .doubleTap {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.green
            self.currentScore += 1
        } else {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.red
            self.currentScore = 0
        }
    }
    
    @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
        print("two finger tap!")
        if self.currentActionGesture == .twoFingerTap {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.green
            self.currentScore += 1
        } else {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.red
            self.currentScore = 0
        }
    }
    
    @IBAction func didLeftSwipe(_ sender: UISwipeGestureRecognizer) {
        print("did swipe left")
        if self.currentActionGesture == .leftSwipe {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.green
            self.currentScore += 1
        } else {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.red
            self.currentScore = 0
        }
    }
    
    @IBAction func didRightSwipe(_ sender: AnyObject) {
        print("did swipe right")
        if self.currentActionGesture == .rightSwipe {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.green
            self.currentScore += 1
        } else {
            self.currentActionGesture = pickRandomActionGesture()
            self.view.backgroundColor = UIColor.red
            self.currentScore = 0
        }
    }
}

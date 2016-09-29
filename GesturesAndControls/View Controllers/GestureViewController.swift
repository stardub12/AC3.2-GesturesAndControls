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
    
    internal var currentActionGesture: ActionGesture = .tap {
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
        self.currentScore = 0
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
    
    func correctActionGesture(selected: Bool) {
        self.currentActionGesture = pickRandomActionGesture()
        
        if selected {
            self.view.backgroundColor = UIColor.green
            self.currentScore += 1
        }
        else {
            self.view.backgroundColor = UIColor.red
            self.currentScore = 0
        }
    }
    
    @IBAction func didPerformGesture(_ sender: UIGestureRecognizer) {
        
        if let tapGesture: UITapGestureRecognizer = sender as? UITapGestureRecognizer {
            
            switch (tapGesture.numberOfTapsRequired, tapGesture.numberOfTouchesRequired, self.currentActionGesture){
            case (1, 1, .tap),
                 (2, 1, .doubleTap),
                 (1, 2, .twoFingerTap):
                self.correctActionGesture(selected: true)
                
            default:
                print("tap type was wrong!")
                self.correctActionGesture(selected: false)
            }
        }
        
        if let swipeGesture: UISwipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
            
            switch (swipeGesture.direction, self.currentActionGesture) {
            case (UISwipeGestureRecognizerDirection.left, .leftSwipe),
                 (UISwipeGestureRecognizerDirection.right, .rightSwipe):
                self.correctActionGesture(selected: true)
                
            default:
                print("was not left/right")
                self.correctActionGesture(selected: false)
            }
        }
    }
    
//    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
//        print("Heck yea I was tapped")
//        self.correctActionGesture(selected: self.currentActionGesture == .tap)
//    }
//    
//    @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
//        print("double tap!")
//        self.correctActionGesture(selected: self.currentActionGesture == .doubleTap)
//    }
//    
//    @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
//        print("two finger tap!")
//        self.correctActionGesture(selected: self.currentActionGesture == .twoFingerTap)
//    }
//    
//    @IBAction func didLeftSwipe(_ sender: UISwipeGestureRecognizer) {
//        print("did swipe left")
//        self.correctActionGesture(selected: self.currentActionGesture == .leftSwipe)
//    }
//    
//    @IBAction func didRightSwipe(_ sender: AnyObject) {
//        print("did swipe right")
//        self.correctActionGesture(selected: self.currentActionGesture == .rightSwipe)
//    }
}

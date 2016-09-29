//
//  GestureViewController.swift
//  GesturesAndControls
//
//  Created by Louis Tur on 9/28/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {

    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("Heck yea I was tapped")
    }
    
}

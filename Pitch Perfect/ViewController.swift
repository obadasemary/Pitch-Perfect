//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Abdelrahman Mohamed on 12/1/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        print("recordAudio")
        recordingInProgress.hidden = false
    }

    @IBAction func stopAudio(sender: UIButton) {
        print("stopAudio")
        recordingInProgress.hidden = true
    }
}


//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Abdelrahman Mohamed on 12/1/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var recordReady: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }

    @IBAction func recordAudio(sender: UIButton) {
        print("recordAudio")
        recordReady.hidden = true
        recordingInProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
    }

    @IBAction func stopAudio(sender: UIButton) {
        print("stopAudio")
        recordingInProgress.hidden = true
        recordReady.hidden = false
        recordButton.enabled = true
    }
}


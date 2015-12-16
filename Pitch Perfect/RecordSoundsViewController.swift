//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Abdelrahman Mohamed on 12/1/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var recordReady: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }
    
    override func viewDidLoad() {
        
        if NSFileManager.defaultManager().fileExistsAtPath(audioFileURL().path!) {
            print("The file already exists !")
        }
    }

    @IBAction func recordAudio(sender: UIButton) {
        
        recordReady.hidden = true
        recordingInProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: audioFileURL(), settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func audioFileURL() -> NSURL {
        
        let filename = "my_audio.wav"
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let pathArray = [dirPath, filename]
        let fileURL = NSURL.fileURLWithPathComponents(pathArray)!
        
        return fileURL
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag){
            recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
            
            performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }else {
            print("Recording was not successful")
            prepareButtons()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="stopRecording"){
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    func prepareButtons(){
        recordingInProgress.hidden = true
        recordReady.hidden = false
        recordButton.enabled = true
    }

    @IBAction func stopAudio(sender: UIButton) {
        prepareButtons()
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}


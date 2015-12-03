//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Abdelrahman Mohamed on 12/2/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let filePath = NSBundle.mainBundle().pathForResource("wana", ofType: "mp3"){
//            let filePathUrl = NSURL.fileURLWithPath(filePath)
//            
//            audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathUrl)
//            audioPlayer.enableRate = true
//            
//        }else {
//            print("the filePath is empty")
//        }
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        print("playSlowAudio")
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        print("playFastAudio")
        audioPlayer.stop()
        audioPlayer.rate = 2
        audioPlayer.play()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        print("playChipmunkAudio")
        audioPlayer.stop()
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        print("playDarthVaderAudio")
        audioPlayer.stop()
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch (pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)

        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        try! audioEngine.start()
        audioPlayerNode.play()
    }
    
    @IBAction func stopAllAudio(sender: UIButton) {
        print("stopAllAudio")
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
    }
}

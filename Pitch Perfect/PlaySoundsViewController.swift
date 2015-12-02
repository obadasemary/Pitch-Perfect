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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let filePath = NSBundle.mainBundle().pathForResource("wana", ofType: "mp3"){
            let filePathUrl = NSURL.fileURLWithPath(filePath)
            
            audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathUrl)
            audioPlayer.enableRate = true
            
        }else {
            print("the filePath is empty")
        }
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
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        print("playDarthVaderAudio")
        audioPlayer.stop()
    }
    
    @IBAction func stopAllAudio(sender: UIButton) {
        print("stopAllAudio")
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
    }
}

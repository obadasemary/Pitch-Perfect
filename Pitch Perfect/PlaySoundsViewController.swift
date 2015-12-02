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
    var audioPlayer2:AVAudioPlayer!
    var reverbPlayers:[AVAudioPlayer] = []
    let N:Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let filePath = NSBundle.mainBundle().pathForResource("wana", ofType: "mp3"){
            let filePathUrl = NSURL.fileURLWithPath(filePath)
            
            audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathUrl)
            audioPlayer2 = try! AVAudioPlayer(contentsOfURL: filePathUrl)
            
            audioPlayer.enableRate = true
            
            for _ in 0...N {
                let temp = try! AVAudioPlayer(contentsOfURL: filePathUrl,
                    fileTypeHint: "mp3")
                reverbPlayers.append(temp)
            }
            
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
        audioPlayer2.stop()
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        print("playFastAudio")
        audioPlayer.stop()
        audioPlayer.rate = 2
        audioPlayer.play()
        audioPlayer2.stop()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        print("playChipmunkAudio")
        audioPlayer.stop()
        audioPlayer2.stop()
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        print("playDarthVaderAudio")
        audioPlayer.stop()
        audioPlayer2.stop()
    }
    
    @IBAction func playEchoAudio(sender: UIButton) {
        print("playEchoAudio")
        audioPlayer.stop()
        audioPlayer.currentTime = 0;
        audioPlayer.play()
        
        let delay:NSTimeInterval = 0.1//100ms
        var playtime:NSTimeInterval
        playtime = audioPlayer2.deviceCurrentTime + delay
        audioPlayer2.stop()
        audioPlayer2.currentTime = 0
        audioPlayer2.volume = 0.8;
        audioPlayer2.playAtTime(playtime)
    }
    
    @IBAction func playReverbAudio(sender: UIButton) {
        print("playReverbAudio")
        /*
        20ms produces detectable delays
        */
        let delay:NSTimeInterval = 0.02
        for i in 0...N {
            let curDelay:NSTimeInterval = delay*NSTimeInterval(i)
            let player:AVAudioPlayer = reverbPlayers[i]
            //M_E is e=2.718...
            //dividing N by 2 made it sound ok for the case N=10
            let exponent:Double = -Double(i)/Double(N/2)
            let volume = Float(pow(Double(M_E), exponent))
            player.volume = volume
            player.playAtTime(player.deviceCurrentTime + curDelay)
        }
    }
    
    
    @IBAction func stopAllAudio(sender: UIButton) {
        print("stopAllAudio")
        audioPlayer.stop()
        audioPlayer2.stop()
        audioPlayer.currentTime = 0.0
    }
}

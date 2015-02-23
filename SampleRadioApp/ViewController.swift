//
//  ViewController.swift
//  SampleRadioApp
//
//  Created by Lucian Cancescu on 15/11/14.
//  Copyright (c) 2014 Lucian Cancescu. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    var player:AVPlayer = AVPlayer(URL: NSURL(string: "http://www.radiobrasov.ro/listen.m3u"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playButton.setTitle("Play", forState: UIControlState.Normal)
        if NSClassFromString("MPNowPlayingInfoCenter") != nil {
//            let image:UIImage = UIImage(named: "logo_player_background")!
//            let albumArt = MPMediaItemArtwork(image: image)
            var songInfo: NSMutableDictionary = [
                MPMediaItemPropertyTitle: "Radio Brasov",
                MPMediaItemPropertyArtist: "87,8fm",
//                MPMediaItemPropertyArtwork: albumArt
            ]
            MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = songInfo
        }
        if (AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)) {
            println("Receiving remote control events")
            UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        } else {
            println("Audio Session error.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        toggle()
    }

    func toggle() {
        if playButton.titleLabel?.text == "Play" {
            playRadio()
        } else {
            pauseRadio()
        }
    }
    
    func playRadio() {
        player.play()
        playButton.setTitle("Pause", forState: UIControlState.Normal)
    }
    
    func pauseRadio() {
        player.pause()
        playButton.setTitle("Play", forState: UIControlState.Normal)
    }

    override func remoteControlReceivedWithEvent(event: UIEvent) {
        if event.type == UIEventType.RemoteControl {
            if event.subtype == UIEventSubtype.RemoteControlPlay {
                println("received remote play")
                playRadio()
            } else if event.subtype == UIEventSubtype.RemoteControlPause {
                println("received remote pause")
                pauseRadio()
            } else if event.subtype == UIEventSubtype.RemoteControlTogglePlayPause {
                println("received toggle")
                toggle()
            }
        }
    }
}


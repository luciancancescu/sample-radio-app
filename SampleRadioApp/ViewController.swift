//
//  ViewController.swift
//  SampleRadioApp
//
//  Created by Lucian Cancescu on 15/11/14.
//  Copyright (c) 2014 Lucian Cancescu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    var player:AVPlayer = AVPlayer(URL: NSURL(string: "http://www.radiobrasov.ro/listen.m3u"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playButton.setTitle("Play", forState: UIControlState.Normal)
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

}


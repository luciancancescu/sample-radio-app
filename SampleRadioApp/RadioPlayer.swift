//
//  RadioPlayer.swift
//  SampleRadioApp
//
//  Created by Lucian Cancescu on 06.08.15.
//  Copyright (c) 2015 Lucian Cancescu. All rights reserved.
//

import Foundation
import AVFoundation

class RadioPlayer {
    static let sharedInstance = RadioPlayer()
    private var player = AVPlayer(URL: NSURL(string: "http://www.radiobrasov.ro/listen.m3u"))
    private var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = false
    }
    
    func pause() {
        player.pause()
        isPlaying = true
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
}

//
//  ViewController.swift
//  joachimPlayer
//
//  Created by Rafael Schwarzenberger on 23.07.18.
//  Copyright © 2018 Rafael Schwarzenberger. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    
    // Um den Pause Zustand zu bestimmen
    var hasBeenPaused = false
    
    func prepareSongAndSession(){
    
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Parallel_Park_-_01_-_Impulse", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch let sessionError {
                print(sessionError)
            }
        } catch let audioPlayerError {
            print(audioPlayerError)
        }
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var forButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSongAndSession()
        
//        // Instantiate a new music player
//        let myMediaPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer
//        // Add a playback queue containing all songs on the device
//        myMediaPlayer.setQueue(with: MPMediaQuery.songs())
//        // Start playing from the beginning of the queue
//        myMediaPlayer.play()
//
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.playButton.frame = CGRect(x: self.playButton.frame.origin.x - (self.playButton.bounds.size.height / 2), y: self.playButton.frame.origin.y, width: self.playButton.frame.size.height, height: self.playButton.frame.size.height)
        self.playButton.layer.cornerRadius = self.playButton.bounds.size.height / 2
        
        self.backButton.frame = CGRect(x: self.backButton.frame.origin.x - (self.backButton.bounds.size.height / 2), y: self.backButton.frame.origin.y, width: self.backButton.frame.size.height, height: self.backButton.frame.size.height)
        self.backButton.layer.cornerRadius = self.backButton.bounds.size.height / 2
        
        self.pauseButton.frame = CGRect(x: self.pauseButton.frame.origin.x - (self.pauseButton.bounds.size.height / 2), y: self.pauseButton.frame.origin.y, width: self.pauseButton.frame.size.height, height: self.pauseButton.frame.size.height)
        self.pauseButton.layer.cornerRadius = self.pauseButton.bounds.size.height / 2
        
        self.forButton.frame = CGRect(x: self.forButton.frame.origin.x - (self.forButton.bounds.size.height / 2), y: self.forButton.frame.origin.y, width: self.forButton.frame.size.height, height: self.forButton.frame.size.height)
        self.forButton.layer.cornerRadius = self.forButton.bounds.size.height / 2
    }


    @IBAction func onPlayButton(_ sender: UIButton) {
        
        audioPlayer.play()
    }
    
    @IBAction func onBackButton(_ sender: UIButton) {
    
    
        
    }
    
    @IBAction func onPauseButton(_ sender: UIButton) {
   
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false
        }
        
        
    }

//    @IBAction func restartButton(_ sender: UIButton) {
//
//        if audioPlayer.isPlaying || hasBeenPaused {
//            audioPlayer.stop()
//            audioPlayer.currentTime = 0
//
//          //  audioPlayer.pause()
//        } else {
//            audioPlayer.play()
//        }
//
//    }
    
    @IBAction func onForButton(_ sender: UIButton) {
    
    //audioPlayer.forwardingTarget(for: )
        
    }
    
}


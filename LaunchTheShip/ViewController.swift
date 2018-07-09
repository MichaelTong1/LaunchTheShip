//
//  ViewController.swift
//  LaunchTheShip
//
//  Created by Michael Tong on 7/8/18.
//  Copyright © 2018 Michael Tong. All rights reserved.
//

import UIKit
import AVFoundation // Allows to play sound

class ViewController: UIViewController {
    
    // Initialize these connections

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var launchLbl: UILabel!
    @IBOutlet weak var launchBox: UIView!
    @IBOutlet weak var launchBtn: UIButton!
    @IBOutlet weak var clouds: UIImageView!
    
    
    var player: AVAudioPlayer!
    var player2: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // First load
        
        // Get the path for the sound
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        let path2 = Bundle.main.path(forResource: "pew", ofType: "wav")!
        let url2 = URL(fileURLWithPath: path2)
        do { // The error if cannot get audio
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player2 = try AVAudioPlayer(contentsOf: url2)
            player2.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }


    // If power button is pressed
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        // Play sound effect
        player.play()
        
        // Move rocket
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 480, width: 375, height: 0)
        }) { (finished) in
            self.launchLbl.isHidden = false
            self.launchBox.isHidden = false
            self.launchBtn.isHidden = false
        }
        
    }
    
    @IBAction func launchBtnPressesd(_ sender: Any) {
        
        player2.play()
        
        self.launchBtn.isHidden = true
        self.launchBox.isHidden = true
        self.launchLbl.isHidden = true
        self.clouds.isHidden = true
        
        UIView.animate(withDuration: 1.0, animations: {
            self.rocket.frame = CGRect(x: 0, y: 900, width: 375, height: 0)
        })
            UIView.animate(withDuration: 5.0, animations: {
                self.rocket.frame = CGRect(x: (-100), y: 850, width: 375, height: 0)
            })
            UIView.animate(withDuration: 6.0, animations: {
                self.rocket.frame = CGRect(x: 100, y: 800, width: 375, height: 0)
            })
        }
    
    }




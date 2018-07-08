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
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // First load
        
        // Get the path for the sound
        
        let path = Bundle.main.path(forResource: "LaunchTheShip", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do { // The error if cannot get audio
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
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
            self.rocket.frame = CGRect(x: 0, y: 20, width: 375, height: 186)
        }) { (finished) in
            self.launchLbl.isHidden = false
        }
        
    }
    
    

}


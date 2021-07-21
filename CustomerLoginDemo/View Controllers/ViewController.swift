//
//  ViewController.swift
//  CustomerLoginDemo
//
//  Created by Harvey Duperier on 7/21/21.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayLayer:AVPlayerLayer?

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    
    func setUpVideo() {
        //Get PAth to bundle
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        //Create url link
        let url = URL(fileURLWithPath: bundlePath!)
        
        
        //Create Video player item
        let item = AVPlayerItem(url: url)
        
        // Create player
        videoPlayer = AVPlayer(playerItem: item)
        
        
        //Create layer
        videoPlayLayer = AVPlayerLayer(player: videoPlayer!)
        
        
        //Adjust size/frame
        videoPlayLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayLayer!, at: 0)
        
        
        //Display and play
        videoPlayer?.playImmediately(atRate: 0.3)
    }

    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }

}


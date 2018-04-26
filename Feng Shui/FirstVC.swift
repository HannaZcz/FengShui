//
//  ViewController.swift
//  Feng Shui
//
//  Created by 周纯稚 on 04/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit
import AVFoundation


class FirstVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    //    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.animationImages = [
            UIImage(named: "image0"),
            UIImage(named: "image1"),
            UIImage(named: "image2"),
            UIImage(named: "image3"),
            UIImage(named: "image4")] as? [UIImage]
        imageView.animationDuration = 10
        imageView.startAnimating()
    }
    
    
    
    @IBAction func startYourJourneyPressed(_ sender: UIButton) {
    }
    
    
}


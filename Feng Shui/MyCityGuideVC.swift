//
//  MyCityGuideVC.swift
//  Feng Shui
//
//  Created by 周纯稚 on 19/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit
import AVFoundation



class MyCityGuideVC: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var cities = [String]()
    var citySelected = 0
    let citySound: [String] = ["sound1"]
    var sound = [Sound]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities.append("Shanghai")
        cities.append("Nantong")
        cities.append("Beijing")
        // Play sound functions
        playSound(soundName: "sound1", audioPlayer: &audioPlayer)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.delegate = self as? AVAudioPlayerDelegate
                audioPlayer.play()
            } catch {
                print("Error: Couldn't play sound \(soundName)") }
        } else {
            print("Error: Couldn't load data from file \(soundName)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailedCityViewController
        destination.city = cities[citySelected]
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        citySelected = sender.tag
        performSegue(withIdentifier: "ShowDetailedCity", sender: nil)
    }
    
}

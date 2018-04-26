//
//  DetailedCityViewController.swift
//  Feng Shui
//
//  Created by 周纯稚 on 19/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit

class DetailedCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var city = ""
    
    let cityOverview = [
        ["Shanghai", "Fun Facts:\n\nIn Shanghai, 11.5 million bicycles are used every day, 330 metro stations dot the city. \n\nBy far the most popular after-dinner activity is karaoke."],
        ["Nantong", "Fun Facts:\n\nNantong is called 'First Modern City' after the collapse of the Qing Dynasty. \n\nThe city‘s prosperity has traditionally depended on salt production, cotton agriculture, and manufacture of cotton textiles \n\nIt's the origin of - Blue Calico (see picture)."],
        ["Beijing", "Fun Facts:\n\nIn Beijing, 13 million bicycles are used every day. \n\n2500 restaurants can be found. \n\nMany seniors practice calligraghy in parks, on marble or concrete surfaces. This is a lesson in Taoism, which calls for perfection not only in the work itself but also in the gesture."]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameLabel.text = city
        for cityInfo in cityOverview {
            if city == cityInfo[0] {
                overviewLabel.text = cityInfo[1]
            }
        }
        // animating Images
        cityImageView.animationImages = [
            UIImage(named: "image7"),
            UIImage(named: "image8"),
            UIImage(named: "image9"),
            UIImage(named: "TaiKooLi"),
            UIImage(named: "image6"),
            UIImage(named: "image10"),
            UIImage(named: "langshan"),
            ] as? [UIImage]
        cityImageView.animationDuration = 15
        cityImageView.startAnimating()
    }
    
    @IBAction func placesToSeePressed(_ sender: UIButton) {
    }
    
    @IBAction func placesToEatPressed(_ sender: UIButton) {
    }
    
}

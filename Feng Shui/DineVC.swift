//
//  DineVC.swift
//  Feng Shui
//
//  Created by 周纯稚 on 19/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit

class DineVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var swipeImageView: UIImageView!
    
    var restaurant: Restaurant!
    
    let imageNames = ["food1","food2","food3","food4","food5","food6","food7","food8","food9","food10","food11","shrimp","wontonsoup","bubbletea","braisedpork","food12","food13","food14","food15"]
    
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if restaurant == nil {
            restaurant = Restaurant(name: "", description: "", website: "")
        }
        nameLabel.text = restaurant.name
        descriptionLabel.text = restaurant.description
        websiteLabel.text = restaurant.website
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                if currentImage == imageNames.count - 1 {
                    currentImage = 0
                }else{
                    currentImage += 1
                }
                swipeImageView.image = UIImage(named: imageNames[currentImage])
                
            case UISwipeGestureRecognizerDirection.right:
                if currentImage == 0 {
                    currentImage = imageNames.count - 1
                }else{
                    currentImage -= 1
                }
                swipeImageView.image = UIImage(named: imageNames[currentImage])
            default:
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        restaurant.name = nameLabel.text!
        restaurant.description = descriptionLabel.text!
        restaurant.website = websiteLabel.text!
    }
}

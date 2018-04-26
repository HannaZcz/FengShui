//
//  DetailedPlacesVC.swift
//  Feng Shui
//
//  Created by 周纯稚 on 20/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import UIKit

class DetailedPlacesVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if place == nil {
            place = Place(name: "", placeDescription: "", address: "")
        }
        updateUserInterface()
    }
    
    func updateUserInterface() {
        nameLabel.text = place?.name
        descriptionLabel.text = place?.placeDescription
        addressLabel.text = place?.address
    }
    
}


//
//  Structs.swift
//  Feng Shui
//
//  Created by 周纯稚 on 21/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

struct City {
    var overview: String
}

struct Sound {
     var soundName: String
}

struct Restaurant {
    var name: String
    var description: String
    var website: String
}

struct Place {
    var name: String
    var placeDescription: String
    var address: String
    
    init(name: String, placeDescription: String, address: String) {
        self.name = name
        self.placeDescription = placeDescription
        self.address = address
        
    }
    //NSObject, MKAnnotation
    //, coordinate: CLLocationCoordinate2D
    // self.coordinate = coordinate
    // var coordinate: CLLocationCoordinate2D
}

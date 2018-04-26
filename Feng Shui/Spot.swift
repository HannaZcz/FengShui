//
//  Spot.swift
//  Feng Shui
//
//  Created by 周纯稚 on 21/04/2018.
//  Copyright © 2018 周纯稚. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Spot: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var name: String
    var address: String
  
    var latitude: CLLocationDegrees {
        return coordinate.latitude
    }
    
    var longitude: CLLocationDegrees {
        return coordinate.longitude
    }
    
    var title: String? {
        return name
    }
    
    var subtitle: String? {
        return address
    }
    
    var dictionary: [String: Any] {
        return ["name":name, "address": address, "longitude":longitude, "latitude":latitude]
}

    
    init(name: String, address: String, coordinate: CLLocationCoordinate2D){
        self.name = name
        self.address = address
        self.coordinate = coordinate
    }
    
    convenience override init() {
        self.init(name: "", address: "", coordinate: CLLocationCoordinate2D())
    }
    
    convenience init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! String? ?? ""
        let address = dictionary["address"] as! String? ?? ""
        let latitude = dictionary["latitude"]  as! CLLocationDegrees? ?? 0.0
        let longitude = dictionary["longitude"]  as! CLLocationDegrees? ?? 0.0
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       
        self.init(name: name, address: address, coordinate: coordinates)
    }
}

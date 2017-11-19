//
//  BreweryAnnotion.swift
//  Beerworld
//
//  Created by Gabriel on 11/18/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit
import MapKit


class BreweryAnnotion: NSObject,MKAnnotation {

    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
}

//
//  Brewery.swift
//  Beerworld
//
//  Created by Gabriel on 11/16/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit

class Brewery: NSObject {

    var name:String
    var streetAddress:String
    var phone:String
    var latitude:String
    var longitude:String
    
    
    init(name:String, streetAddress:String, phone:String, latitude:String, longitude:String) {
        self.name = name
        self.streetAddress = streetAddress
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
    }
    
}


//
//  City.swift
//  Beerworld
//
//  Created by Gabriel on 11/15/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit

class City: NSObject, NSCoding {

    
    
    let cityName:String
    let lat:String
    let lng:String
    
    init(cityName:String, lat:String, lng:String) {
        self.cityName = cityName
        self.lat = lat
        self.lng = lng
    }
    
    required init?(coder aDecoder: NSCoder) {

        self.cityName = aDecoder.decodeObject(forKey: "cityName") as! String
        self.lat = aDecoder.decodeObject(forKey: "lat") as! String
        self.lng = aDecoder.decodeObject(forKey: "lng") as! String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(cityName, forKey: "cityName")
        aCoder.encode(lat, forKey: "lat")
        aCoder.encode(lng, forKey: "lng")
    }


}

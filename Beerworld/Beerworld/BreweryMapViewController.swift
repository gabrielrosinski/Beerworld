//
//  BreweryMapViewController.swift
//  Beerworld
//
//  Created by Gabriel on 11/16/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit

class BreweryMapViewController: UIViewController {

    var city:City?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //zoom on the cities location
        
        
        if let existingCity = city {
            DataManager.sharedInstance.fetchBreweries(lat: existingCity.lat, lng: existingCity.lng) { (result) in
                
                
                print("")
                
                
                //create annotations from brewery objects
                //add them to the map
                //realod the map with the annotations
                
            }
            
        }else{
            print("city doesnt exist")
        }
        

        
    }

    
    
    

}

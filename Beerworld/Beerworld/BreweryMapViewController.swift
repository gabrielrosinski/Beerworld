//
//  BreweryMapViewController.swift
//  Beerworld
//
//  Created by Gabriel on 11/16/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit
import MapKit

class BreweryMapViewController: UIViewController {

    var city:City?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //zoom on the cities location
        let latitude:CLLocationDegrees = (city?.lat as! NSString).doubleValue
        let longitude:CLLocationDegrees = (city?.lng as! NSString).doubleValue
        
        let latDelta:CLLocationDegrees = 0.05
        let lonDelta:CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        if let existingCity = city {
            DataManager.sharedInstance.fetchBreweries(lat: existingCity.lat, lng: existingCity.lng) { (result) in
                
                
                var breweriesArray:[Brewery] = result
                
                var latitude:Double
                var longitude:Double
                var subtitle:String
                
                if breweriesArray.count == 0 {
                    
                    let alert = UIAlertController(title: "Tough luck", message: "This city has no breweries", preferredStyle: UIAlertControllerStyle.alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
                        alert.dismiss(animated: true, completion: nil)
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    
                    for brewery in breweriesArray{
                        
                        latitude = (brewery.latitude as NSString).doubleValue
                        longitude = (brewery.longitude as NSString).doubleValue
                        subtitle = brewery.streetAddress
                        if brewery.phone != "null" {
                            subtitle = subtitle + "\n" + brewery.phone
                        }
                        
                        //create annotations from brewery objects
                        var breweryAnnotion = BreweryAnnotion(title: brewery.name, subtitle: subtitle, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                        
                        //add them to the map
                        self.mapView.addAnnotation(breweryAnnotion)
                        
                    }
                    
                    //realod the map with the annotations
                    self.mapView.reloadInputViews()
                    
                }
            }
            
        }else{
            print("city doesnt exist")
            
            let alert = UIAlertController(title: "Technical issue", message: "This city does not exists", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        

        
    }

    
    
    

}

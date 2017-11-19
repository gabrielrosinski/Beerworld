//
//  DataManager.swift
//  Beerworld
//
//  Created by Gabriel on 11/15/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit
import CSV
import MapKit
import SwiftyJSON


class DataManager: NSObject {
    
    static let sharedInstance = DataManager()
    
    var citiesDict:[String:City] = [String:City]()
    
    var citiesArray:[City] = [City]()
//    var breweriesArray:[Brewery] = [Brewery]()
    
    private override init() {
        super.init()
    }
    
    func initCityData(){
        
        var cityName:String
        var city:City

        
        
        if citiesExist(){
            
            loadCitiesData()
            
        }else{
            guard let stream = InputStream(fileAtPath: Bundle.main.path(forResource: "cityList", ofType: "csv")!)else { return }
            let csv = try! CSVReader(stream: stream)
            while let row = csv.next() {
                
                if row.count > 1 && row[0] != "city"{
                    cityName = row[0]
                    city = City(cityName: cityName , lat: row[2], lng: row[3])
                    citiesArray.append(city)
                }
            }
            
            let data = NSKeyedArchiver.archivedData(withRootObject: citiesArray)
            UserDefaults.standard.set(data, forKey: "citiesArray")
            
//            let cityExistsBool = NSKeyedArchiver.archivedData(withRootObject: true)
//            UserDefaults.standard.set(cityExistsBool, forKey: "citiesExist")
            UserDefaults.standard.setValue(true, forKey: "citiesExist")
        }

    }
    
    
    func citiesExist() -> Bool
    {
        if let exist = UserDefaults.standard.object(forKey: "citiesExist") as? Bool {
            return true
        }else{
            return false
        }
    }
    
    func loadCitiesData() -> Bool
    {
        if let data = UserDefaults.standard.object(forKey: "citiesArray") as? NSData {
            self.citiesArray = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [City]
            return true
        }else{
            print("loading cities data was corrupted")
            return false
        }
    }

    
    func fetchBreweries(lat:String, lng:String, callback: @escaping (([Brewery]) -> Void))
    {
        NetworkManager.sharedInstance.getBrewriesByRequest(lat: lat, lng: lng) { (results) in
            
            //clear the array for new query
            var breweriesArray = [Brewery]()
            
            let breweryJsonArray:JSON = results

            var breweryItem:Brewery
            var name:String
            var streetAddress:String
            var phone:String
            var latitude:String
            var longitude:String
            
            for brewery in breweryJsonArray {
                
                name = brewery.1["brewery"]["name"].rawString()!
                latitude = brewery.1["latitude"].rawString()!
                longitude = brewery.1["longitude"].rawString()!
                streetAddress = brewery.1["streetAddress"].rawString()!
                phone = brewery.1["phone"].rawString()!
                                
                breweryItem = Brewery(name: name, streetAddress: streetAddress, phone: phone, latitude: latitude, longitude: longitude)
                breweriesArray.append(breweryItem)
                
            }

            callback(breweriesArray)
            
        }

    }
    
}

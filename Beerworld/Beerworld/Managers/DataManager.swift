//
//  DataManager.swift
//  Beerworld
//
//  Created by Gabriel on 11/15/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit
import CSV


class DataManager: NSObject {
    
    static let sharedInstance = DataManager()
    
    var citiesDict:[String:City] = [String:City]()
    
    var citiesArray:[City] = [City]()
    
    private override init() {
        super.init()
    }
    
    func initCityData(){
        
        var cityName:String
        var city:City

        guard let stream = InputStream(fileAtPath: Bundle.main.path(forResource: "cityList", ofType: "csv")!)else { return }
        let csv = try! CSVReader(stream: stream)
        while let row = csv.next() {
            
            if row.count > 1 && row[0] != "city"{
                cityName = row[0]
//                citiesDict[cityName] = City(cityName: cityName , lat: row[2], lng: row[3])
                
                city = City(cityName: cityName , lat: row[2], lng: row[3])
                citiesArray.append(city)
            }
        }

        let data = NSKeyedArchiver.archivedData(withRootObject: citiesDict)
        UserDefaults.standard.set(data, forKey: "citiesDict")
  
    }
    
    
    func loadCitiesData()
    {
        if let data = UserDefaults.standard.object(forKey: "citiesDict") as? NSData {
            citiesDict = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [String : City]
        }else{
            print("loading cities data was corrupted")
        }
    }


}

//TODO: Earase later
//    var citiesDict:[String:(String,String)]!
//    var cityName:String
//    var coordinateTuple:(String,String)
//
//    guard let stream = InputStream(fileAtPath: Bundle.main.path(forResource: "cityList", ofType: "csv")!)else { return }
//    let csv = try! CSVReader(stream: stream)
//    while (csv.next() != nil) {
//        print("\(row)")
//                cityName = csv["city"]!
//                coordinateTuple = (csv["lat"]!,csv["lng"]!)
//                citiesDict[cityName] = coordinateTuple
//                print(citiesDict[cityName])
//    }

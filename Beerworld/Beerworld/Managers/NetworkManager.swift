//
//  NetworkManager.swift
//  Beerworld
//
//  Created by Gabriel on 11/16/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class NetworkManager: NSObject {
    
    static let sharedInstance = NetworkManager()
    
    
    let baseUrl = "http://api.brewerydb.com/v2/"
    let apiKey = "&key=d546a7004f19ab65565464d52c1ca322"
    let searchUrl1 = "search/geo/point?lat="
    let searchUrl2 = "&lng="
    
    //Example
    ///search/geo/point?lat=35.772096&lng=-78.638614
    
    func getBrewriesByRequest(lat:String, lng:String, callback: @escaping ((JSON) -> Void))
    {
        

        //The response will come back empty if in the coordinate have no breweries
        //url with breweries
//        let url = baseUrl + searchUrl1 + "35.776817" /*lat*/ + searchUrl2 + "-78.635987" /*lng*/ + apiKey
        let url = baseUrl + searchUrl1 + lat + searchUrl2 + lng + apiKey
        
        Alamofire.request(url).responseJSON { response in
//            print("Request: \(String(describing: response.request))\n")   // original url request
//            print("Response: \(String(describing: response.response))\n") // http url response
//            print("Result: \(response.result)\n")                         // response serialization result
            
            if let jsonObject = response.result.value {
//                print("JSON: \(json)") // serialized json response
                var json = JSON(jsonObject)
                var breweryArray = json["data"]
                
                callback(breweryArray)
                
                
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }

}

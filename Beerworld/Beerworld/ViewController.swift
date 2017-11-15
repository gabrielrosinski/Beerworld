//
//  ViewController.swift
//  Beerworld
//
//  Created by Gabriel on 11/15/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let stream = InputStream(fileAtPath: "LocalFiles/cityList.csv")!
//        let csv = try! CSVReader(stream: stream)
//        let csv = try CSV(name: Bundle.mainBundle.pathForResource("cityList", ofType: "csv"))
        
//        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("cityList.csv")
//        guard let stream = OutputStream(toFileAtPath: url.path, append: false) else { return }
        
        
        DataManager.sharedInstance.initCityData()

    }


}


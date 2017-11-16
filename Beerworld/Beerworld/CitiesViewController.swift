//
//  CitiesViewController.swift
//  Beerworld
//
//  Created by Gabriel on 11/15/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let count = DataManager.sharedInstance.citiesDict.count
//        return count > 0 ? count : 0
        
        let count = DataManager.sharedInstance.citiesArray.count
        return count > 0 ? count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        
        cell.backgroundColor = .random
        
        cell.cityName.text = DataManager.sharedInstance.citiesArray[indexPath.row].cityName
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }

}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}

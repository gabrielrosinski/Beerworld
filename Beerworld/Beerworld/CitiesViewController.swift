//
//  CitiesViewController.swift
//  Beerworld
//
//  Created by Gabriel on 11/15/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isSearching = false
    
    var filteredData = [City]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if isSearching {
            return filteredData.count
        }
        
        let count = DataManager.sharedInstance.citiesArray.count
        return count > 0 ? count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        
        cell.backgroundColor = .random
        
        if isSearching {
            cell.cityName.text = filteredData[indexPath.row].cityName
        }else{
            cell.cityName.text = DataManager.sharedInstance.citiesArray[indexPath.row].cityName
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let breweryMapViewController: BreweryMapViewController = storyboard?.instantiateViewController(withIdentifier: "BreweryMapViewController") as! BreweryMapViewController

        if isSearching {
            breweryMapViewController.city = filteredData[0]
        }else{
            breweryMapViewController.city = DataManager.sharedInstance.citiesArray[indexPath.row]
        }
  
        self.navigationController?.pushViewController(breweryMapViewController, animated: true)
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearching = false
            
            view.endEditing(true)
            
            tableView.reloadData()
            
        }else{
            
            isSearching = true

            filteredData = DataManager.sharedInstance.citiesArray.filter({$0.cityName == searchBar.text})
            
            tableView.reloadData()
            
        }
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

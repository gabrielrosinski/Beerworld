//
//  CityTableViewCell.swift
//  Beerworld
//
//  Created by Gabriel on 11/15/17.
//  Copyright © 2017 Gabriel. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cityName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

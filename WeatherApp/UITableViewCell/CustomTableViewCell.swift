//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Максим Окунеев on 4/14/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    override var reuseIdentifier: String? {
       return "CustomTableViewCell"
    }
}

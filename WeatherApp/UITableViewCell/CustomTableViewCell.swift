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
    
    func configure(with weatherData: WeatherData){
            
        self.cityLabel.text = weatherData.name
//        self.timeLabel.text = weatherData.main?.humidity
        self.currentTempLabel.text = "\(weatherData.main?.temp ?? 0) C"
        self.minTempLabel.text = "\(weatherData.main?.temp_min ?? 0) C"
        self.maxTempLabel.text = "\(weatherData.main?.temp_max ?? 0) C"
    }
    
}

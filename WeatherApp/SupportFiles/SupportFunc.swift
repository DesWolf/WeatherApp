//
//  SupportFunc.swift
//  WeatherApp
//
//  Created by Максим Окунеев on 4/14/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

struct Calc {
    static func farengToCelc(temp: Double) -> Int {
        let celcTemp = Int(temp - 273.15)
        return celcTemp
    }
}

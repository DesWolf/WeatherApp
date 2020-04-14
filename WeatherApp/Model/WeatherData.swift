//
//  Whether.swift
//  WhetherApp
//
//  Created by Максим Окунеев on 4/13/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let coord: Coord?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let name: String?
//    let cod: Int?
}

struct Coord: Decodable {
    let lon: Double?
    let lat: Double?
}

struct Main: Decodable {
    let temp: Double?
    let temp_min: Double?
    let temp_max: Double?
    let humidity: Int?
}

struct Wind: Decodable {
    let speed: Int?
    let deg: Int?
}

struct Clouds: Decodable {
    let all: Int?
}

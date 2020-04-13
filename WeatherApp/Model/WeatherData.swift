//
//  Whether.swift
//  WhetherApp
//
//  Created by Максим Окунеев on 4/13/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

class WeatherData: Codable {
    var coord: Coord?
    var weather: Weather?
    var base: String?
    var main: Main?
    var dt: Int?
}

class Coord: Codable {
    var lon: Double?
    var lat: Double?
}

class Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

class Main: Codable {
    var temp: Float?
}

//    {"coord":
//    {"lon":37.62,"lat":55.75},
//    "weather":
//    [
//    {"id":804,
//    "main":"Clouds",
//    "description":"overcast clouds",
//    "icon":"04n"
//    }
//    ],
//    "base":"stations","main":
//    {"temp":283.85,
//        "feels_like":278.11,
//        "temp_min":280.15,
//        "temp_max":286.15,
//        "pressure":1002,
//        "humidity":25},
//    "visibility":10000,
//    "wind":
//    {
//        "speed":4,
//        "deg":150
//    },
//    "clouds":{
//        "all":91
//
//    }
//    "dt":1586801928,"sys":{"type":1,
//        "id":9029,
//        "country":"RU",
//        "sunrise":1586744921,
//        "sunset":1586795450},
//    "timezone":10800,
//    "id":524901,
//    "name":"Moscow",
//    "cod":200
//}

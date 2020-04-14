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
    let cod: Int
}

struct Coord: Decodable {
    let lon: Double?
    let lat: Double?
}

struct Main: Decodable {
    let temp: Float?
}

struct Wind: Decodable {
    let speed: Int?
    let deg: Int?
}

struct Clouds: Decodable {
    let all: Int?
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

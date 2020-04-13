//
//  Network.swift
//  WhetherApp
//
//  Created by Максим Окунеев on 4/13/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

struct NetworkService {
    
    private init() {
    }
    
    static let shared: NetworkService = NetworkService()
    
     // MARK: Network
    func fetchWeather(city: String, completion: @escaping (WeatherData?) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [URLQueryItem(name: "q", value: city),
                                    URLQueryItem(name: "appid", value: "5413b464dd02b162651d5d7f9c6f7174")]
        
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) { (data, responce, error) in
            if error == nil {
                let decoder = JSONDecoder()
                let decoderModel: WeatherData?
                if data != nil {
                    decoderModel = try? decoder.decode(WeatherData.self, from: data!)
                completion(decoderModel)
                }
            } else {
                print(error as Any)
            }
        }.resume()
    }
    
//
//        URLSession.shared.dataTask(with: url) { (data, responce, error) in
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    let jsonData = try decoder.decode([WeatherData].self, from: data)
//
//                    DispatchQueue.main.async {
//                        completion(jsonData)
//                    }
//                } catch let error {
//                    DispatchQueue.main.async {
//                        print ("Error serialization JSON", error)
//                        completion([])
//                    }
//                }
//            } else {
//                DispatchQueue.main.async {
//                    networkAlert()
//                }
//            }
//        }.resume()
    
    
//
//
//    // MARK: Network Alert
//    static func networkAlert() {
//        let alertController = UIAlertController(title: "Error", message: "Network is unavaliable! Please try again later!", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
//        rootViewController?.present(alertController, animated: true, completion: nil)
//    }
}

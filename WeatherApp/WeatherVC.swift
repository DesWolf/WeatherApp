//
//  ViewController.swift
//  WhetherApp
//
//  Created by Максим Окунеев on 4/13/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UISearchResultsUpdating {
    
    private var weatherData = WeatherData()
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()

        
    }
    
    //MARK: NavigationBar
    private func setupNavigationBar() {
        self.navigationItem.title = "Weather App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    //MARK: UISearchResultsUpdating
    func updateSearchResults(for searchController:UISearchController){
        
        let city = searchController.searchBar.text!
        timer.invalidate()
        
        
        if city != "" {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                NetworkService.shared.fetchWeather(city: city) { (model) in
                    print(model?.coord)
                }
            })
        }
    }
   
}


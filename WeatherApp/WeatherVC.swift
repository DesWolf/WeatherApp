//
//  ViewController.swift
//  WhetherApp
//
//  Created by Максим Окунеев on 4/13/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController  {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!

    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataMoscow()
        self.setupNavigationBar()
    }
}

//MARK: Network
extension WeatherVC {
    func fetchDataMoscow() {
        NetworkService.fetchWeather(city: "Moscow") { (model) in
            self.cityLabel.text = model?.name
            self.currentTempLabel.text = "\(Calc.farengToCelc(temp:model?.main?.temp ?? 0)) °"
        }
    }
}

//MARK: NavigationBar
extension WeatherVC {
    private func setupNavigationBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

//MARK: SearchBar
extension WeatherVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController:UISearchController){
        let city = searchController.searchBar.text!
        timer.invalidate()
        
        if city != "" {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                NetworkService.fetchWeather(city: city) { (model) in
                    self.cityLabel.text = model?.name
                    self.currentTempLabel.text = "\(Calc.farengToCelc(temp:model?.main?.temp ?? 0)) ‎°"
                }
            })
        }
    }
}

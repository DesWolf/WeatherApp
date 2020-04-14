//
//  ViewController.swift
//  WhetherApp
//
//  Created by Максим Окунеев on 4/13/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController  {
    
    private var timer = Timer()
    private var contentView: MainView {
        return self.view as! MainView
    }
    private var weatherData: WeatherData? {
        didSet {
            self.contentView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.loadView()
        
        self.setupNavigationBar()
        (self.view as! MainView).tableView.dataSource = self
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
                    self.weatherData = model
                    print(model?.coord?.lat)
                }
            })
        }
    }
}

//MARK: NavigationBar
extension WeatherVC {
    private func setupNavigationBar() {
        self.navigationItem.title = "Weather Application"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

//MARK: TableViewDataSource
extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherData!.visibility!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        
        return cell
    }
}

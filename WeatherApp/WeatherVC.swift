//
//  ViewController.swift
//  WhetherApp
//
//  Created by Максим Окунеев on 4/13/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController  {
    
    
    @IBOutlet weak var tableView: UITableView!
    private var weatherData = [WeatherData]()
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataMoscow()
        self.setupNavigationBar()
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
                    self.weatherData.append(model!)
                    print(self.weatherData)
                }
            })
        }
    }
}

//MARK: Network
extension WeatherVC {
    func fetchDataMoscow() {
        NetworkService.fetchWeather(city: "Moscow") { (model) in
            self.weatherData.append(model!)
        self.tableView.reloadData()
        self.tableView.tableFooterView = UIView()
            print(self.weatherData)
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
extension WeatherVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let weather = weatherData[indexPath.row]
        cell.configure(with: weather)
        
        return cell
    }
}

//
//  MainView.swift
//  WeatherApp
//
//  Created by Максим Окунеев on 4/14/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
     
    var tableView = UITableView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firtInitialization()
        self.setupConstraints()
    }
    
    private func firtInitialization() {
        self.addSubview(tableView)
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "CustomTableViewCell")
    }

    private func setupConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

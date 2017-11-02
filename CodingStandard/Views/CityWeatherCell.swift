//
//  CityWeatherCell.swift
//  CodingStandard
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//
import UIKit

class CityWeatherCell: UITableViewCell {
    
    static public let cellIdentifier = "CityWeatherCell"
    
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var tempratureLable: UILabel!
    
    func loadData(weather : WeatherModel){
        cityNameLable.text = weather.city
        tempratureLable.text = "\(weather.maxTemp) °"
    }
}


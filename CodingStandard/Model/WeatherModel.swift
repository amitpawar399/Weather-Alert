//
//  WeatherModel.swift
//  CodingStandard
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import Foundation

class WeatherModel {
    
    private var _city: String!
    private var _description: String!
    private var _maxTemp: Int!
    private var _minTemp: Int!
    private var _humidity: Int!
    private var _pressure: Int!
    
    var city: String {
        if _city == nil {
            return ""
        }
        return _city
    }
    var descriptions: String {
        if _description == nil {
            return ""
        }
        return _description
    }
    var maxTemp: Int {
        return _maxTemp
    }
    var minTemp: Int {
        return _minTemp
    }
    var humidity: Int {
        return _humidity
    }
    var pressure: Int {
        return _pressure
    }
    
    init(data : NSDictionary) {
        
        if let name = data.value(forKey: "name") as? String {
            _city = name;
        }
        if let weatherList = data.value(forKey: "weather") as? [NSDictionary]{
            if weatherList.count > 0 {
                if let description = weatherList[0].value(forKey: "description") as? String {
                    _description = description;
                }
                
            }
        }
        if let main = data.value(forKey: "main") as? NSDictionary{
            if let temp_min = main.value(forKey: "temp_min") as? Int {
                _minTemp = temp_min;
            }
            if let maxTemp = main.value(forKey: "temp_max") as? Int {
                _maxTemp = maxTemp;
            }
            if let humidity = main.value(forKey: "humidity") as? Int {
                _humidity = humidity;
            }
            if let pressure = main.value(forKey: "pressure") as? Int {
                _pressure = pressure;
            }
        }
    }
}

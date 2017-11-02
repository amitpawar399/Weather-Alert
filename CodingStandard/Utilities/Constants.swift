//
//  Constants.swift
//  CodingStandard
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import Foundation

 private let openWeatherApiKey = "0b59aee7aaf00fd5703d0cf3ed5655fb"

 private let cityidies = "4163971,2147714,2174003"   // Sydney | Melbourne | Brisbane

 let weatherCityListUrl = "http://api.openweathermap.org/data/2.5/group?id=\(cityidies)&units=metric&appid=\(openWeatherApiKey)";


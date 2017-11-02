//
//  CitiesDownloader.swift
//  CodingStandard
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import Foundation

class CitiesDownloader {
    
 typealias CompletionHandler = (_ Respones: [WeatherModel]) -> Void
 
    static func fetchData(completionHandler: @escaping CompletionHandler){
        var weatherInfoArray = [WeatherModel]()
        NetworkWrapper.request(url: weatherCityListUrl, method: .get , parameter : [:] , encoding: .dafaultEncoding, headers: .headerDefault, loader: " ", responsType: .text) { (response) in
            switch response.isSuccessfull {
            case response.success :
                 let dataDic = response.valueDictionary
                if let cityDataList  = dataDic["list"] as? [NSDictionary] {
                
                    for cityData  in cityDataList {
                        let mWeatherModel = WeatherModel(data: cityData)
                        weatherInfoArray.append(mWeatherModel)
                    }
                }
                 completionHandler(weatherInfoArray)
                break
            case response.failure :
                
                break
            default:
                break
            }
        }
    }
}

//
//  Utilities.swift
//  CodingStandard
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import Foundation
import UIKit
class Utilities {
    
    
    static func loadWeatherVC(viewController : UIViewController, weatherData : WeatherModel){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "WeatherDetailsVC")  as! WeatherDetailsVC
        controller.weather = weatherData
        viewController.navigationController?.pushViewController(controller, animated: false)
    }
}



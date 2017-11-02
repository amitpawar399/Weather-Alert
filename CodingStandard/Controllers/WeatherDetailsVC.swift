//
//  WeatherDetailsVC.swift
//  CodingStandard
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import UIKit
import EFCountingLabel
class WeatherDetailsVC : UIViewController {
    
    @IBOutlet weak var cityNameLable : UILabel!
    @IBOutlet weak var descriptionLable : UILabel!
    @IBOutlet weak var avgTempLable : EFCountingLabel!
    @IBOutlet weak var minTempLable : EFCountingLabel!
    @IBOutlet weak var maxTempLable : EFCountingLabel!
    @IBOutlet weak var pressureLable : EFCountingLabel!
    @IBOutlet weak var humidityLable : EFCountingLabel!
    var weather : WeatherModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLable.text = weather.city
        descriptionLable.text = weather.descriptions
        avgTempLable.loadLable(value: (weather.minTemp + weather.maxTemp ) / 2, suffix:  " °")
        minTempLable.loadLable(value: weather.minTemp, suffix:  " °")
        maxTempLable.loadLable(value: weather.maxTemp, suffix:  " °")
        pressureLable.loadLable(value:  weather.pressure, suffix:  " hPa")
        humidityLable.loadLable(value: weather.humidity, suffix:  " %")
    }
}

//
//  ViewController.swift
//  CodingStandard
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import UIKit

class CitiesListVC: UIViewController {

    @IBOutlet weak var citiesTableView: UITableView!
    
    var cityArray = [WeatherModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        CitiesDownloader.fetchData { (cityArray) in
            self.cityArray = cityArray
            self.citiesTableView.reloadData()
        }
    }
}
extension CitiesListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherCell.cellIdentifier, for: indexPath) as! CityWeatherCell
        cell.loadData(weather: cityArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Utilities.loadWeatherVC(viewController: self, weatherData: cityArray[indexPath.row])
    }
}


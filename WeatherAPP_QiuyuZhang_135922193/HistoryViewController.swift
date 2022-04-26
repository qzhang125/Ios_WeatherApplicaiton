//
//  HistoryViewController.swift
//  WeatherAPP_QiuyuZhang_135922193
//
//  Created by Qiuyu Zhang on 2022-03-20.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var weatherTableView: UITableView!
    var newCollection:[WeatherCollection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell", for:indexPath) as! WeatherTableCell
        
        let currentWeather:WeatherCollection = newCollection[indexPath.row]
        
        cell.cityNamelbl.text = "\(currentWeather.cityName) at \(currentWeather.localTime)"
        cell.temperatureLbl.text = "\(currentWeather.temp)"
        cell.windlbl.text = "Wind:\(currentWeather.windSpeed)kph from \(currentWeather.WindDirection)"
        
        return cell
    }
}

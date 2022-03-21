//
//  ScreenBViewController.swift
//  WeatherAPP_QiuyuZhang_135922193
//
//  Created by Qiuyu Zhang on 2022-03-15.
//


import UIKit

class ScreenBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var weatherTableView: UITableView!

    let viewController = ViewController()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController.savedCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "myCell", for:indexPath) as! weatherViewCell
        
        let currentWeather:WeatherCollection = viewController.savedCollection[indexPath.row]
        
        cell.lblCityNameAndTIme.text = "\(String(describing: currentWeather.localTime)) at \(String(describing: currentWeather.localTime) )"
        cell.lblTemperature.text = "\(String(describing: currentWeather.temp))"
        cell.lblWindSpeedAndDir.text = "\(String(describing: currentWeather.windSpeed))kph from \(String(describing: currentWeather.WindDirection))"
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  WeatherAPP_QiuyuZhang_135922193
//
//  Created by Qiuyu Zhang on 2022-03-15.
//

import UIKit
import MapKit
import Combine
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var errorAddressLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    @IBOutlet weak var localTImeLabel: UILabel!
    
    @IBOutlet weak var inputAddress: UITextField!
    
    var savedCollection:[WeatherCollection] = []
    //Get the current location of the device
    var myLocationManager:CLLocationManager!
    
    //Geocoder object
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //initialize the location manager
        self.myLocationManager = CLLocationManager()
        
        self.myLocationManager.requestWhenInUseAuthorization()
        
        self.myLocationManager.startUpdatingLocation()
        
        self.myLocationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let currPosition = locations.first{
            let lat = currPosition.coordinate.latitude
            let lng = currPosition.coordinate.longitude
            
            //The place to show to the user
            let mapCenter = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            let zoomLevel = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: mapCenter, span: zoomLevel)
            
            //configure the map
            self.mapView.setRegion(region, animated: true)
            self.mapView.showsUserLocation = true
            
            //Get the City name by using reverse geocoding
            self.getAddress(lat: lat, lng: lng)
        }
    }
    
    private func getAddress(lat:Double, lng:Double){
        let location = CLLocation(latitude: lat, longitude: lng)
        self.geocoder.reverseGeocodeLocation(location){
            (resultList, error) in
            print("Send request to geocoding service, waiting for response")
            
            if(error != nil){
                print("Error occured during geocoding request")
                print(error)
                return
            }
            if (resultList != nil){
                if resultList!.count == 0{
                    //Note able to find a coordiante
                    print("No address found for this coordinates")
                }else{
                    //found address
                    let placemark:CLPlacemark = resultList!.first!
                    
                    let city = placemark.locality!
                    //print(city)
                    //connect to the API end point
                    let apiEndpoint = "https://api.weatherapi.com/v1/current.json?key=a1ec2943f4124cc480212619222003&q=\(city)&aqi=no"
        
                    //Convert the string into a URL object
                    guard let apiURL = URL(string:apiEndpoint) else {
                        print("Could not convert the string endpoint to an URL object")
                        return
                    }
                    
                    URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
                        if let err = error {
                            print("Error occured while fetching data from api")
                            print(err)
                            return
                        }
                        
                        //Got data back from the weather api
                        if let jsonData = data {
                            //print(jsonData)
                            do{
                                let decoder = JSONDecoder()
                                let decodedItem:Weather = try decoder.decode(Weather.self, from: jsonData)
                                //print(decodedItem)
                                DispatchQueue.main.async {
                                    self.cityLabel.text = decodedItem.location.cityName
                                    self.temperatureLabel.text = "\(decodedItem.current.temperature)°C"
                                    self.windSpeedLabel.text = "\(decodedItem.current.windSpeed)"
                                    self.windDirectionLabel.text = "\(decodedItem.current.windDirection)"
                                    self.localTImeLabel.text = decodedItem.location.localTime
                                }
                            }
                            catch let error{
                                print("Error occur during Json decoding")
                                print(error)
                            }
                        }
                    }.resume()
                }
            }
        }
    }

    @IBAction func btnPressed(_ sender: Any) {
        guard let nextScreen = storyboard?.instantiateViewController(identifier: "screenB") as? ScreenBViewController else {
            print("Cannot find next screen")
            return
        }
        
        // - navigate to the next screen
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let savedWeather = WeatherCollection(city: cityLabel.text ?? "No city name given", temp: temperatureLabel.text ?? "No temperature given", ws: windSpeedLabel.text ?? "No wind speed given", w_dir: windDirectionLabel.text ?? "No wind direction given", localTime: localTImeLabel.text ?? "No local time given")
        savedCollection.append(savedWeather)
    }
}


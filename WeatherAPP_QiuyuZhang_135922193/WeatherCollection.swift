//
//  WeatherCollection.swift
//  WeatherAPP_QiuyuZhang_135922193
//
//  Created by Qiuyu Zhang on 2022-03-20.
//

import Foundation
struct WeatherCollection{
    var cityName: String
    var temp:String
    var windSpeed:String
    var WindDirection:String
    var localTime:String
    
    init(city:String, temp:String, ws:String, w_dir:String, localTime:String){
        self.cityName = city
        self.temp = temp
        self.windSpeed = ws
        self.WindDirection = w_dir
        self.localTime = localTime
    }
}

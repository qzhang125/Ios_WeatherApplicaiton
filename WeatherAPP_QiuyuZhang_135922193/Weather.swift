//
//  Weather.swift
//  WeatherAPP_QiuyuZhang_135922193
//
//  Created by Qiuyu Zhang on 2022-03-16.
//

import Foundation
struct Weather:Codable{
    let location:Location
    let current:Current
    
    func encode(to encoder: Encoder) throws {
        //do nothing
    }
}

struct Location: Codable{
    var cityName: String = ""
    var localTime: String = ""
    
    enum CodingKeys:String, CodingKey{
        case cityName="name"
        case localTime="localtime"
    }
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        self.cityName = try response.decodeIfPresent(String.self, forKey: CodingKeys.cityName) ?? "No city name given"
        self.localTime = try response.decodeIfPresent(String.self, forKey: CodingKeys.localTime) ?? "No local time given"
    }
}

struct Current: Codable{
    var temperature: Double = 0.0
    var windSpeed: Double = 0.0
    var windDirection: String = ""
    
    enum CodingKeys:String, CodingKey{
        case temperature="temp_c"
        case windSpeed="wind_kph"
        case windDirection="wind_dir"
    }
    
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        self.temperature = try response.decodeIfPresent(Double.self, forKey: CodingKeys.temperature) ?? 0.0
        self.windSpeed = try response.decodeIfPresent(Double.self, forKey: CodingKeys.windSpeed) ?? 0.0
        self.windDirection = try response.decodeIfPresent(String.self, forKey: CodingKeys.windDirection) ?? "No wind direction given"
    }
}

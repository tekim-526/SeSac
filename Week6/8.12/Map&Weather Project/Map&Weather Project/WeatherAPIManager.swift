//
//  WeatherAPIManager.swift
//  Map&Weather Project
//
//  Created by Kim TaeSoo on 2022/08/13.
//

import Foundation

import Alamofire
import SwiftyJSON


struct WeatherAPIManager {
    private let url: String
    
    typealias weatherInfo = (weather :String, iconURL: String, temp: Double, humidity: Int, country: String, windSpeed: Double)
    init(latitude: Double, longitude: Double) {
        self.url = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(APIKey.Weather_APIKey)"
    }
    func getWeather(completionHandler: @escaping (weatherInfo) -> ()) {
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var weatherInfo: weatherInfo
                let iconURL: String = "http://openweathermap.org/img/wn/\(json["weather"][0]["icon"].stringValue)@2x.png"
                
                weatherInfo = (json["weather"][0]["main"].stringValue, iconURL, json["main"]["temp"].doubleValue - 273.15, json["main"]["humidity"].intValue, json["sys"]["country"].stringValue, json["wind"]["speed"].doubleValue)
                completionHandler(weatherInfo)

            case .failure(let error):
                print(error)
            }
        }
    }
}

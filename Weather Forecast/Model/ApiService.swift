//
//  WeatherResponse.swift
//  Weather Forecast
//
//  Created by Elham on 17/05/2024.
//


import Foundation
import Alamofire

class ApiService {
    
    private static let apiKey = "a561958487d442b893570641241805"
    private static let baseURL = "https://api.weatherapi.com/v1/forecast.json"
   
    static func fetchWeather(with lat: String, and lon: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let parameters: [String: String] = [
            "key": apiKey,
            "q": "\(lat),\(lon)",
            "days": "3",
            "aqi": "yes",
            "alerts": "no"
        ]
        
        AF.request(baseURL, parameters: parameters).validate().responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let weatherData):
                completion(.success(weatherData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}



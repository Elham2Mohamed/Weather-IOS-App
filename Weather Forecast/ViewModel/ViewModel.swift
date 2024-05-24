//
//  ViewModel.swift
//  Weather Forecast
//
//  Created by Elham on 18/05/2024.
//

import SwiftUI
import Combine
import CoreLocation

class ViewModel: ObservableObject {
    @Published var weatherResponse: WeatherResponse?
    @Published var locationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        locationManager.$location
            .compactMap { $0 }
            .sink { [weak self] location in
                self?.fetchWeatherResponse(for: location)
            }
            .store(in: &cancellables)
    }
    
    func fetchWeatherResponse(for location: CLLocationCoordinate2D) {
        let lat = String(location.latitude)
        let lon = String(location.longitude)
        ApiService.fetchWeather(with: lat, and: lon) { [weak self] result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self?.weatherResponse = weatherResponse
                }
            case .failure(let error):
                print("Error fetching weather data: \(error.localizedDescription)")
            }
        }
    }
}

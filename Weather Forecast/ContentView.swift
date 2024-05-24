//
//  ContentView.swift
//  Weather Forecast
//
//  Created by Elham on 17/05/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            if let currentWeather = viewModel.weatherResponse {
                HomeView(weatherResponse: currentWeather)
            } else {
                Background()
                
            }
        }
        .onAppear {
            viewModel.locationManager.requestLocation()
        }
    }
}

#Preview {
    ContentView()
}


//
//  HomeView.swift
//  Weather Forecast
//
//  Created by Elham on 19/05/2024.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    var weatherResponse: WeatherResponse?
    @State private var isShowingAlert = false
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                if let response = weatherResponse {
                    VStack {
                        Spacer()
                        Text(response.location?.name ?? "")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .padding(.top ,10)
                           
                        Text("\(Int(response.current?.tempC ?? 0))\u{00B0}")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .bold()
                        Text(response.current?.condition?.text ?? "")
                            .font(.title)
                            .foregroundColor(Color.white)
                        
                        HStack {
                            Text("H: \(Int(response.forecast?.forecastday?[0].day?.maxtempC ?? 0))\u{00B0}")
                                .font(.title3)
                                .foregroundColor(Color.white)
                            Text("L: \(Int(response.forecast?.forecastday?[0].day?.mintempC ?? 0))\u{00B0}")
                                .font(.title3)
                                .foregroundColor(Color.white)
                        }
                        ZStack {
                            Image(systemName: "image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                                .foregroundColor(.gray)
                            
                            if let iconUrl = response.forecast?.forecastday?[0].day?.condition?.icon,
                               let url = URL(string: "https:\(iconUrl)") {
                                KFImage(url)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 64, height: 64)
                                    .padding()
                                    }
                                    
                            }
                        
                       
                        ListView(forecast: response.forecast)
                        Spacer()
                        CollectionView(current: response.current)
                    }
                }
            }
        }.alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("No Internet Connection"),
                message: Text("Please check your internet connection and try again."),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            
            if !Reachability.isConnectedToNetwork() {
                
                isShowingAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(weatherResponse: nil)
    }
}

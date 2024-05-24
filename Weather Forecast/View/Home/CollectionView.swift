//
//  CollectionView.swift
//  Weather Forecast
//
//  Created by Elham on 19/05/2024.
//

import SwiftUI

struct CollectionView: View {
    var current: Current?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                HStack(spacing: 50) {
                    WeatherItemView(title: "VISABILITY", value: "\(Int(current?.visKM ?? 10)) Km")
                    WeatherItemView(title: "HUMIDITY", value: "\(Int(current?.humidity ?? 10))%")
                }
                
                HStack(spacing: 50) {
                    WeatherItemView(title: "FEELS LIKE", value: "\(Int(current?.feelslikeC ?? 16))\u{00B0}")
                    WeatherItemView(title: "PRESSURE", value: "\(Int(current?.pressureMB ?? 1021))")
                }
            }
            .padding([.leading, .trailing], 50)
        }
    }
}
#Preview {
    CollectionView()
}

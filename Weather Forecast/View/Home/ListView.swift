//
//  HomeView.swift
//  Weather Forecast
//
//  Created by Elham on 18/05/2024.
//
import SwiftUI

struct ListView: View {
    let forecast: Forecast?
    var body: some View {
        List {
            Section {
                ForEach(forecast?.forecastday ?? []) { day in
                    NavigationLink(destination: DetailsListView(hours: day.hour)) {
                        ListRow(forecastday: day)
                            .listRowBackground(Color.clear)
                    }
                    
                }
            } header: {
                Text("3-Days Forecast")
                    .font(.title3)
                    .padding(.leading)
                    .foregroundColor(Color.white)
                    .bold()
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .background(.clear)
       
    }
    
}

#Preview {
    ListView(forecast: nil)
}

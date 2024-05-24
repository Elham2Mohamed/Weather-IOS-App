//
//  DetailsRow.swift
//  Weather Forecast
//
//  Created by Elham on 20/05/2024.
//

import SwiftUI

struct DetailsListView: View {
    var hours: [Hour]?
    @State private var isShowingAlert = false
    var body: some View {
        ZStack {
            Background()
            VStack {
                List(filteredHours(hours: hours ?? [])) { hour in
                    DetailsRow(hour: hour)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .background(.clear)
                .listRowBackground(Color.clear)
                .listStyle(InsetListStyle())
                .padding()
            }.safeAreaPadding(.top,20)
        }
       
    .alert(isPresented: $isShowingAlert) {
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
    func filteredHours(hours: [Hour]) -> [Hour] {
        let now = Date()
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: now)
        
        let filteredHours = hours.filter { hour in
            guard let hourDate = CustomDateFormatter.dateFromString(hour.time) else {
                return false
            }
            
            
            let dayDiff = calendar.dateComponents([.day], from: now, to: hourDate).day ?? 0
            
           
            if calendar.isDateInToday(hourDate) {
                return calendar.component(.hour, from: hourDate) >= currentHour
            }
            
          
            return dayDiff == 0 || dayDiff == 1 || dayDiff == 2
        }
        
        return filteredHours
    }
}

#Preview {
    DetailsListView(hours: [])
}

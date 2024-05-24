//
//  ListRow.swift
//  Weather Forecast
//
//  Created by Elham on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct ListRow: View {
   
    let forecastday: Forecastday?
    var body: some View {
        VStack {
            HStack {
                Text(CustomDateFormatter.getDayByDate(dateString: forecastday?.date))
                    .font(.title3)
                    .foregroundColor(Color.white)
                
                Spacer()
                ZStack {
                    Image(systemName: "image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .foregroundColor(.gray)
                    
                    if let iconUrl = forecastday?.day?.condition?.icon,
                       let url = URL(string: "https:\(iconUrl)") {
                        KFImage(url)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                            .padding()
                            }
                            
                    }
                Spacer()
                let formattedString = String(format: "%.1f\u{00B0} - %.1f\u{00B0}", forecastday?.day?.mintempC ?? 0, forecastday?.day?.maxtempC ?? 0)
                
                Text(formattedString)
                    .font(.title3)
                    .foregroundColor(Color.white)
            }
            .padding([.leading, .trailing])
        }
        .frame(height: 25)
        .background(Color.clear)
        .padding(.leading, 8)
        .padding(.bottom, 8)
        .padding(.trailing, 8)
    }
    
    
}

#Preview {
    ListRow(forecastday: Forecastday(date: "15/5/2024", dateEpoch: 8, day: Day(maxtempC: 24, mintempC: 50, condition: Condition(text: "", icon: "", code: 0)), astro: nil, hour: []))
}

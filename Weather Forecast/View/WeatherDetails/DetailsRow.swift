//
//  DetailsRow.swift
//  Weather Forecast
//
//  Created by Elham on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct DetailsRow: View {
    var hour: Hour?
    var body: some View {
        VStack {
            HStack {
                
                Text(CustomDateFormatter.formateHour(hourString: hour?.time))
                    .font(.title3)
                    .foregroundColor(Color.white)
                    .padding(.leading,35)

                ZStack {
                    Image(systemName: "image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .foregroundColor(.gray)
                    
                    if let iconUrl = hour?.condition?.icon,
                       let url = URL(string: "https:\(iconUrl)") {
                        KFImage(url)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                            .padding()
                            }
                            
                    }
                    
                
                let formattedString = String(format: "%.1f\u{00B0}", hour?.tempC ?? 0)
                Text(formattedString)
                    .font(.title3)
                    .foregroundColor(Color.white)
            }
            .padding([.leading, .trailing])
        }
        .frame(height: 25)
        .background(Color.clear)
        .padding(.bottom, 20)
    }
}

#Preview {
    DetailsRow()
}

//
//  WeatherItemView.swift
//  Weather Forecast
//
//  Created by Elham on 18/05/2024.
//

import SwiftUI

struct WeatherItemView: View {
   
    var title: String
      var value: String
      
      var body: some View {
          VStack {

              Text(title)
                  .font(.title2)
                  .foregroundColor(Color.white)
              
              Text(value)
                  .font(.title3)
                  .fontWeight(.semibold)
                  .foregroundColor(Color.white)
          }
      }


}

#Preview {
    WeatherItemView( title: "String", value: "String")
}

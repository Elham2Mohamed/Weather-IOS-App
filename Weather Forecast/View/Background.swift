//
//  Background.swift
//  Weather Forecast
//
//  Created by Elham on 19/05/2024.
//

import SwiftUI

struct Background: View {
    var body: some View {
        let backgroundImage: Image

        if CustomDateFormatter.isMorning() {
            backgroundImage = Image(.morning)
            
            
        } else {
            backgroundImage = Image(.night)
           
        }
        
        return backgroundImage
                .resizable()
                .blur(radius: 1.5)
                .edgesIgnoringSafeArea([.top, .bottom])
                .aspectRatio(contentMode: .fill)
            
    }
}


#Preview {
    Background()
}

//
//  WeatherButton.swift
//  WeatherAppSwiftUI
//
//  Created by Connor Cole on 8/4/21.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var bColor: Color = Color.white
    var fontColor: Color = Color.blue
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(bColor)
            .foregroundColor(fontColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10.0)
    
    }
}

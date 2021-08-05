//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Connor Cole on 8/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true

    var body: some View {
        ZStack {
            BackgroundView(isNight:$isNight)
            VStack(spacing: 8) {
                cityTextView(city: "Kennesaw")
                todayWeatherView(imageName: "cloud.sun.fill", temp: "76")
                mainWeatherView()
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time")
                }
                Spacer()
            }
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
    LinearGradient(gradient: Gradient(colors:
                                [isNight ? .black : .blue,
                                isNight ? .gray : Color("lightBlue")]
                        ),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct dayView: View {
    var day: String
    var icon: String
    var temp: String
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size:16, weight: .medium, design: .default))
            Image(systemName: icon)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(temp + "°")
        }
        .font(.system(size:22, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
}


struct cityTextView: View {
    var city: String
    var body: some View {
        Text("Kennesaw, GA")
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct todayWeatherView: View {
    var imageName: String
    var temp: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180, height: 180)
        }
        
        Text("\(temp)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
            .padding(.bottom, 40)
    }
}

struct mainWeatherView: View {
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
            dayView(day: "TUE", icon: "cloud.sun.fill", temp: "72")
            dayView(day: "WED", icon: "sun.max.fill", temp: "77")
            dayView(day: "THU", icon: "wind.snow", temp: "81")
            dayView(day: "FRI", icon: "cloud.sun.fill", temp: "87")
            dayView(day: "SAT", icon: "sunset.fill", temp: "84")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  homework1
//
//  Created by Connor Cole on 8/3/21.
//

import SwiftUI


struct ContentView: View {
    var themes = ["faceEmojis", "animalEmojis", "sportEmojis"]
    
    @State var themeOptions =  [
        "faceEmojis" : ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇" ],
        "animalEmojis" : ["🙉", "🙊", "🐒", "🐔", "🐧", "🐦", "🐤", "🐣", "🐥", "🦆", "🦅"],
        "sportEmojis" : ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓" ]
    ]
    
    @State var themeIconOptions =  [
        "faceEmojis" : Image(systemName: "face.smiling"),
        "animalEmojis" : Image(systemName: "tortoise.fill"),
        "sportEmojis" : Image(systemName: "gamecontroller")
    ]
    

    
    @State var currentTheme = "faceEmojis"
    @State var emojiCount = 10

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 200))]){
                        ForEach(themeOptions[currentTheme]![0..<emojiCount], id: \.self ,content: { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        })
                    }
                    .foregroundColor(.red)
                    .padding(.horizontal)
                }
            }
            Spacer()
            HStack {
                ForEach(themes, id: \.self ,content: { theme in
                    themeSelectorView(themeIcon: themeIconOptions[theme]!, emojisList: themeOptions[theme]!).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            currentTheme = theme
                            themeOptions[theme]?.shuffle()
                        }
                })
                
                
//                themeSelectorView(themeIcon: themeIconOptions["faceEmojis"]!, emojisList: themeOptions["faceEmojis"]!).onTapGesture(perform: {
//                    currentTheme = "faceEmojis"
//                    themeOptions[currentTheme]?.shuffle()
//                })
//                themeSelectorView(themeIcon: themeIconOptions["animalEmojis"]!, emojisList: themeOptions["animalEmojis"]!).onTapGesture(perform: {
//                    currentTheme = "animalEmojis"
//                    themeOptions[currentTheme]?.shuffle()
//                })
//                themeSelectorView(themeIcon: themeIconOptions["sportEmojis"]!, emojisList: themeOptions["sportEmojis"]!).onTapGesture(perform: {
//                    currentTheme = "sportEmojis"
//                    themeOptions[currentTheme]?.shuffle()
//                })
                
                
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            HStack {
                remove
                Spacer()
                add
            }.font(.largeTitle).padding(.horizontal, 10.0)
        }
    }
    


    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        },
        label: {
            Image(systemName: "minus.circle")
        })
    }


    var add: some View {
        Button {
            if emojiCount < 10 {
                emojiCount += 1
            }
        }
        label: {
            Image(systemName: "plus.circle")
        }
    }
}
    


struct themeSelectorView: View {
    var themeIcon: Image
    var emojisList: [String]
    var body: some View {
        ZStack {
            label: do {
                themeIcon
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(height: 100)
        .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    var content : String
    @State var isFaceUp : Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 30)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle).foregroundColor(.green)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

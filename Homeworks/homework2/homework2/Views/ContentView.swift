//
//  ContentView.swift
//  homework2
//
//  Created by Connor Cole on 8/5/21.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMatchingGame
    
    var body: some View {
        VStack {
            HStack {
                Text("Score: \(viewModel.playerScore)")
                Text("Theme: \(viewModel.getCurrentTheme.id)")
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60, maximum: 200))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(viewModel.currentThemeColor)
                .padding(.horizontal)
            }
            HStack {
                ForEach(viewModel.list_of_themes) { theme in
                    ThemeView(theme: theme, color: viewModel.convertColor(theme.theme_color)).aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            viewModel.chooseTheme(theme)
                        }
                }
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(height: 100)
        }
    }
}
    


struct CardView: View {
    let card: MatchingGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 30)
            if card.isFaceUp && !card.isMatched {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle).foregroundColor(.green)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ThemeView: View {
    let theme: Theme
    let color: Color
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            shape.fill().foregroundColor(color)
            Text(theme.theme_emojis[0])
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMatchingGame()
        ContentView(viewModel: game)
    }
}

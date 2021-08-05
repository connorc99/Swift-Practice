// VIEW
//  ContentView.swift
//  Memorize
//
//  Created by Connor Cole on 8/3/21.
//
//OOP for logic to UI, functional for UI

import SwiftUI //use Swift code package for SwiftUI, don't need for logic files

//: View means this is a View type, inherits functionality
struct ContentView: View {
    //collections of variables, can also have functions in structs in Swift
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 200))]){
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
        .font(.largeTitle)
        .padding(.horizontal, 10.0)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(Color.green)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}



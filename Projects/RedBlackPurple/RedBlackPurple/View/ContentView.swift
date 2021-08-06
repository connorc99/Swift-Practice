//
//  ContentView.swift
//  RedBlackPurple game
//
//  Created by Connor Cole on 8/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: RedBlackPurple.RPBGuessingGame
    
    var body: some View {
        VStack {
            PlayerView(streak: viewModel.currentStreakValue, streakType: viewModel.currentStreakType)
            CardView(cards: viewModel.cardsToDisplay, cardColors: viewModel.getCardColors)
                .frame(minWidth: 500, minHeight: 400, idealHeight: .infinity, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                GuessView(color: "Red", cardColor: Color.red).onTapGesture {
                    viewModel.guess("Red")
                }
                GuessView(color: "Black", cardColor: Color.gray).onTapGesture {
                    viewModel.guess("Black")
                }
                GuessView(color: "Purple", cardColor: Color.purple).onTapGesture {
                    viewModel.guess("Purple")
                }
            }.padding()

        }
        
    }
}

struct PlayerView: View {
    let streak: Int
    let streakType: String
    
    var body: some View {
        Text("\(streakType): \(streak)")
    }
}


// Text("\(i.cardSuite.rawValue), \(i.cardFaceValue)")
struct CardView: View {
    let cards: Array<GuessingGame.Card>
    let cardColors: Array<Color>
    var body: some View {

        HStack(content: {
            ForEach(cards.indices, id: \.self) {i in
                IndCardView(card: cards[i], cardColor: cardColors[i])
            }
        })
        
        
    }
}

struct IndCardView: View {
    let card: GuessingGame.Card
    let cardColor: Color

    var body: some View {
        VStack{
            Text("\(card.cardFaceValue)")
            Text("\(card.cardSuite.rawValue)")
        }.foregroundColor(cardColor)
    }
}

struct GuessView: View {
    let color: String
    let cardColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle
                .init(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(cardColor)
                .aspectRatio(contentMode: .fit)
            Text(color)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: RPBGuessingGame())
    }
}

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
        ZStack {
            BackgroundView(backgroundColor: viewModel.getBackgroundColorFromGuess)
                .ignoresSafeArea()
                .opacity(Double(viewModel.currentStreakValue) / 10)
            VStack {
                VStack {
                    NewDeckView(endOfDeckReached: viewModel.endOfDeckReached)
                        .frame(minWidth: 100, idealWidth: .infinity, maxWidth: .infinity, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.createNewDeck()
                        }
                    
                    PlayerView(streak: viewModel.currentStreakValue, streakType: viewModel.currentStreakType, remainingCards: viewModel.cards.endIndex - 1)
                }
                
                CardView(cards: viewModel.cardsToDisplay, cardColors: viewModel.getCardColors)
                    .frame(minWidth: 300, minHeight: 400, idealHeight: .infinity, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
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
                }
                .padding([.leading, .bottom, .trailing])
            }
        }
    }
}

struct BackgroundView: View {
    let backgroundColor: Color
    var body: some View {
        return backgroundColor
    }
}

struct NewDeckView: View {
    let endOfDeckReached : Bool
    var body: some View {
        let newDeckText = Text("New Deck")
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(Color.black)
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        let newDeckButton = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .padding([.top, .leading, .trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: .infinity, maxWidth: .infinity, minHeight: 50, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        if endOfDeckReached {
            ZStack{
                newDeckButton.foregroundColor(.green)
                newDeckText
            }
        } else {
            ZStack{
                newDeckButton.foregroundColor(.gray)
                newDeckText
            }
        }
    }
}

struct PlayerView: View {
    let streak: Int
    let streakType: String
    let remainingCards: Int
    
    var body: some View {
        VStack {
            Text("Current Streak")
                .font(.title3)
                .fontWeight(.bold)
            Text("\(streakType): \(streak)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("Remaining: \(remainingCards)")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
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
                    .aspectRatio(2/3, contentMode: .fit)
            }
        })
        
    }
}

struct IndCardView: View {
    let card: GuessingGame.Card
    let cardColor: Color

    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        ZStack {
            cardShape
                .foregroundColor(Color.white)
            cardShape
                .strokeBorder(lineWidth:3)
            VStack{
                HStack {
                    CardCornerView(card: card, cardColor: cardColor)
                    Spacer()
                    CardCornerView(card: card, cardColor: cardColor)
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                Spacer()
                Text("\(card.cardSuite.rawValue)")
                    .font(.system(size: 150))
                Spacer()
                HStack {
                    CardCornerView(card: card, cardColor: cardColor)
                    Spacer()
                    CardCornerView(card: card, cardColor: cardColor)
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                

                
            }.foregroundColor(cardColor)
        }.padding(.all, 8)
    }
}


struct CardCornerView: View {
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
        let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        ZStack {
            shape
                .foregroundColor(cardColor)
            shape
                .strokeBorder(lineWidth: 3)
                
            Text(color)
        }.aspectRatio(3/2, contentMode: .fit)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: RPBGuessingGame())
    }
}

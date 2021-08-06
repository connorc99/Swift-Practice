//
//  RBPGuessingGame.swift
//  RedBlackPurple
//
//  Created by Connor Cole on 8/6/21.
//

import SwiftUI

class RPBGuessingGame: ObservableObject {
    @Published private var model: GuessingGame = createRBPGame()
    
    static func createRBPGame() -> GuessingGame {
        return GuessingGame()
    }
    
    var cards: Array<GuessingGame.Card> {
        return model.cards
    }
    
    var cardsToDisplay: Array<GuessingGame.Card> {

        if model.secondCardToShow != nil {
            return [model.currentCard, model.secondCardToShow!]
        } else {
            return [model.currentCard]
        }
    }
    

    
    var currentCard: GuessingGame.Card {
        return model.currentCard
    }
    
    var currentStreakType: String  {
        return model.currentStreak.currentStreakType
    }
    
    var currentStreakValue: Int {
        if model.currentStreak.currentStreakType == "Correct" {
            return model.currentStreak.currentCorrectStreak
        } else {
            return model.currentStreak.currentWrongStreak
        }
    }
    
    var getCardColors: Array<Color> {
        var cardOneColor: Color
        var cardTwoColor: Color
        if model.currentCard.cardSuite == GuessingGame.Suit.hearts || model.currentCard.cardSuite == GuessingGame.Suit.diamonds {
            cardOneColor = Color.red
        } else {
            cardOneColor = Color.black
        }
        
        if model.secondCardToShow == nil {
            return [cardOneColor]
        }
        
        if model.secondCardToShow!.cardSuite == GuessingGame.Suit.hearts || model.secondCardToShow!.cardSuite == GuessingGame.Suit.diamonds {
            cardTwoColor = Color.red
        } else {
            cardTwoColor = Color.black
        }
        
        return [cardOneColor, cardTwoColor]
        
    }
    
    //MARK: INTENT
    
    func guess(_ color: String) {
        model.guess(color)
    }
}


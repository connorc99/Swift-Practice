//
//  GuessingGame.swift
//  RedBlackPurple
//
//  Created by Connor Cole on 8/6/21.
//

import Foundation

struct GuessingGame {
    private (set) var cards: Array<Card>
    private (set) var currentCard: Card //displayed card
    private (set) var secondCardToShow : Card? //if purple also dispay
    
    private (set) var nextCard: Card //non displayed card
    private (set) var currentStreak: Streak = Streak()
    private (set) var guessWasPurple = false
    
    init() {
        cards = Array<Card>()
        for i in Suit.allCases {
            for j in 1...13 {
                let card = Card(cardSuite: i, cardFaceValue: j, id:"\(i):\(j)")
                cards.append(card)
            }
        }
        cards.shuffle()
        currentCard = cards[0]
        nextCard = cards[1]
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func guess(_ color: String) {
        if (color != "Purple") {
            guessWasPurple = false
            secondCardToShow = nil
            if (color == "Red") {
                if (nextCard.cardSuite == Suit.hearts || nextCard.cardSuite == Suit.diamonds) {
                    updateStreak(guessWasCorrect: true)
                } else {
                    updateStreak(guessWasCorrect: false)
                }
                
            } else if (color == "Black") {
                if (nextCard.cardSuite == Suit.clubs || nextCard.cardSuite == Suit.spades) {
                    updateStreak(guessWasCorrect: true)
                } else {
                    updateStreak(guessWasCorrect: false)
                }
            }
            cards.remove(at: 0)
            currentCard = cards[0]
            nextCard = cards[1]
        } else {
            guessWasPurple = true
            secondCardToShow = cards[1]
            let firstCard = nextCard
            let secondCard = cards[2]
            if ((firstCard.cardSuite == Suit.diamonds || firstCard.cardSuite == Suit.hearts)
                    && (secondCard.cardSuite == Suit.clubs || secondCard.cardSuite == Suit.spades)) {
                updateStreak(guessWasCorrect: true)
            } else if ((firstCard.cardSuite == Suit.clubs || firstCard.cardSuite == Suit.spades)
                        && (secondCard.cardSuite == Suit.hearts || secondCard.cardSuite == Suit.diamonds)) {
                updateStreak(guessWasCorrect: true)
            } else {
                updateStreak(guessWasCorrect: false)
            }
            cards.remove(at: 0)
            cards.remove(at: 0)
            currentCard = cards[0]
            nextCard = cards[1]
        }
        

        
        
    }
    
    mutating func updateStreak(guessWasCorrect: Bool) {
        if guessWasCorrect {
            currentStreak.currentStreakType = "Correct"
            currentStreak.currentCorrectStreak += 1
            currentStreak.currentWrongStreak = 0
        } else {
            currentStreak.currentStreakType = "Wrong"
            currentStreak.currentWrongStreak += 1
            currentStreak.currentCorrectStreak = 0
        }
    }
    
    struct Streak {
        var currentStreakType: String = "Correct"
        var currentCorrectStreak: Int = 0
        var currentWrongStreak: Int = 0
    }
    

    struct Card: Identifiable {
        var cardSuite: Suit
        var cardFaceValue: Int
        var id: String
    }
    
    
    enum Suit: String, CaseIterable {
        case spades = "♠";
        case hearts = "♥";
        case diamonds = "♦";
        case clubs = "♣"
    }
    

    
}



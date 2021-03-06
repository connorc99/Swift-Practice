//  MODELVIEW
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Connor Cole on 8/4/21.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["π", "π", "π", "π³", "β΅οΈ", "β²οΈ", "β½οΈ", "π", "π", "βΎοΈ", "π₯", "πΎ", "π", "π", "π₯", "π±", "πͺ", "π", "π", "π", "π", "π", "π§", "π¦", "π€", "π£", "π₯", "π¦", "π¦"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { i in
            EmojiMemoryGame.emojis[i]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: Intent
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
}

//  MODELVIEW
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Connor Cole on 8/4/21.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚘", "🚃", "🚀", "🛳", "⛵️", "⛲️", "⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🙉", "🙊", "🐒", "🐔", "🐧", "🐦", "🐤", "🐣", "🐥", "🦆", "🦅"]
    
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

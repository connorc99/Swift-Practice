//
//  EmojiMatchingGame.swift
//  homework2
//
//  Created by Connor Cole on 8/5/21.
//

import SwiftUI

class EmojiMatchingGame: ObservableObject {
    
    var themes: Array<Theme>
    @Published private var currentTheme: Theme
    @Published private var model: MatchingGame<String>
    
    init() {
        themes = [
            Theme(id: "faces", theme_color: "red", theme_emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇" ]),
            Theme(id: "animals", theme_color: "blue", theme_emojis: ["🙉", "🙊", "🐒", "🐔", "🐧", "🐦", "🐤", "🐣", "🐥", "🦆", "🦅"]),
            Theme(id: "sports", theme_color: "green", theme_emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓" ])
        ]
        currentTheme = themes[0]
        model = EmojiMatchingGame.createMatchingGame(theme: themes[0])
    }

    
    static func createMatchingGame(theme: Theme) -> MatchingGame<String> {
        MatchingGame<String>(numberOfPairs: theme.theme_emojis.count, createCardContent: {
            i in theme.theme_emojis[i]
        })
    }
    

    func chooseTheme(_ selectedTheme: Theme) {
        currentTheme = selectedTheme
        model = EmojiMatchingGame.createMatchingGame(theme: selectedTheme)
    }
    
    
    
    var cards: Array<MatchingGame<String>.Card> {
        return model.cards
    }
    
    var playerScore : Int {
        return model.score
    }
    
    var getCurrentTheme: Theme {
        return currentTheme
    }
    
    var currentThemeColor: Color {
        switch currentTheme.theme_color {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        default:
            return Color.green
        }
    }
    
    var list_of_themes: Array<Theme> {
        return themes
    }
    
    
    //MARK: INTENT
    
    func choose(_ card: MatchingGame<String>.Card) {
        model.choose(card)
        print("Card chosen at index \(card.id)")
    }
    
    func convertColor(_ color: String) -> Color {
        switch(color) {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        default:
            return Color.green
        }
    }
    
}

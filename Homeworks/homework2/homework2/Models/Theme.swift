//
//  Theme.swift
//  homework2
//
//  Created by Connor Cole on 8/5/21.
//

import Foundation

struct Theme: Identifiable {
    var id: String = "default"
    private (set) var theme_color: String = "green"
    private (set) var theme_emojis: Array<String> = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓" ]
}

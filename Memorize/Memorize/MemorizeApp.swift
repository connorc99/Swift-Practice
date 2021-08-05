//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Connor Cole on 8/3/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

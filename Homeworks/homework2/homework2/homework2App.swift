//
//  homework2App.swift
//  homework2
//
//  Created by Connor Cole on 8/5/21.
//

import SwiftUI

@main
struct homework2App: App {
    let game = EmojiMatchingGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

//
//  RedBlackPurpleApp.swift
//  RedBlackPurple
//
//  Created by Connor Cole on 8/6/21.
//

import SwiftUI

@main
struct RedBlackPurpleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: RedBlackPurple.RPBGuessingGame())
        }
    }
}

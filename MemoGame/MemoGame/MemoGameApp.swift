//
//  MemoGameApp.swift
//  MemoGame
//
//  Created by Татьяна Овсянникова on 26.02.2021.
//

import SwiftUI

@main
struct testApp: App {
    var body: some Scene {
        let game = EmojiMemoGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

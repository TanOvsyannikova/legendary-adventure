//
//  EmojiMemoGame.swift
//  MemoGame
//
//  Created by Татьяна Овсянникова on 26.02.2021.
//

import Foundation

class EmojiMemoGame: ObservableObject {
    @Published private var game: MemoGame<String> = EmojiMemoGame.createMemoGame()
    
    
    
    static func createMemoGame() -> MemoGame<String> {
        let emojis = ["🤬", "❤️", "💔"]

       
        
        return MemoGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    //MARK: - Access to the model
    
    var cards : Array<MemoGame<String>.Card> {
        game.cards
    }
    
    //MARK: - Intents
    
    func choose(card: MemoGame<String>.Card){
        game.choose(card: card)
    }
    

}

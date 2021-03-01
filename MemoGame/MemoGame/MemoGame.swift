//
//  MemoGame.swift
//  MemoGame
//
//  Created by Татьяна Овсянникова on 26.02.2021.
//

import Foundation

struct MemoGame<CardContent> {
    var cards: Array<Card>
        
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of theCard: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == theCard.id {
                return index
            }
        }
        return 0 //TODO: change it
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
}



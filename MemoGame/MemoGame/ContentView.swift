//
//  ContentView.swift
//  MemoGame
//
//  Created by Татьяна Овсянникова on 26.02.2021.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoGame
    var body: some View {
        return HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
                }
            }
        }
        .foregroundColor(.purple)
        .padding()
        .font(.largeTitle)
        
        
    }
}

struct CardView: View {
    var card: MemoGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoGame())
    }
}

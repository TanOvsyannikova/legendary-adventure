//
//  EmojiMemoGameView.swift
//  MemoGame
//
//  Created by Татьяна Овсянникова on 26.02.2021.
//

import SwiftUI

struct EmojiMemoGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoGame
    var body: some View {
        Grid(viewModel.cards)  { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
        }
        .foregroundColor(.purple)
        .padding()
        
        
    }
}

struct CardView: View {
    
    
    var card: MemoGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
        private func body (for size: CGSize) -> some View {
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched{
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(for: size)))
        }
    
    
    //MARK: -Drawing Constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
    private func fontSize (for size: CGSize) -> CGFloat {
        min(size.width , size.height) * 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoGameView(viewModel: EmojiMemoGame())
    }
    
}

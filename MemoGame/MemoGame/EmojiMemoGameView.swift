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
    
    @ViewBuilder
    private func body (for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(120-90)).padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    
    //MARK: -Drawing Constants
    private func fontSize (for size: CGSize) -> CGFloat {
        min(size.width , size.height) * 0.7
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoGame()
        game.choose(card: game.cards[0])
        return EmojiMemoGameView(viewModel: game)
    }
    
}

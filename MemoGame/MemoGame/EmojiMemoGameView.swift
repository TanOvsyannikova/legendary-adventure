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
        VStack {
            Grid(viewModel.cards)  { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear) {
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .foregroundColor(.purple)
            .padding()
            Button(action: {
                withAnimation(.easeInOut) {
                    self.viewModel.resetGame()
                }
            }, label: {
                Text("New Game")
            })
        }
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
            .transition(.scale)
            .rotation3DEffect(
                Angle.degrees(card.isFaceUp ? 0 : 180),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
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

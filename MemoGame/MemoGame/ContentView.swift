//
//  ContentView.swift
//  MemoGame
//
//  Created by Татьяна Овсянникова on 26.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack {
            ForEach(0..<4) { index in
            CardView(isFaceUp: false)
            }
        }
        .foregroundColor(.purple)
        .padding()
        .font(.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
           RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
           RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
           Text("💩")
            } else {
            RoundedRectangle(cornerRadius: 10.0).fill()
            }
   }
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

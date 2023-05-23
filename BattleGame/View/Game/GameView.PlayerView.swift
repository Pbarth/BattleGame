//
//  GameView.PlayerView.swift
//  BattleGame
//
//  Created by Pierre BARTHELEMY on 22/05/2023.
//

import SwiftUI

extension GameView {
    struct PlayerView: View {
        
        public var playerName: String
        public var card: Card?
        public var remaining: Int?
        
        var body: some View {
            VStack {
                Text(playerName)
                Spacer()
                CardView(card: card)
                Spacer()
                if let remainingCards = remaining {
                    Text("Remaining: \(remainingCards)")
                        .font(.system(size: 13))
                }
            }
            .padding()
            .frame(height: 150)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8.0)
        }
    }
}

struct GameView_PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        GameView.PlayerView(playerName: "Player 1", card: Card(suit: .diamond, rank: .ace), remaining: 10)
    }
}

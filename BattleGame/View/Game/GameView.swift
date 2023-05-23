//
//  GameView.swift
//  BattleGame
//
//  Created by Pierre BARTHELEMY on 22/05/2023.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            DealerView(viewModel: viewModel, canTurn: viewModel.canTurn)
            Spacer()
            HStack {
                Spacer()
                PlayerView(playerName: "Player 1", card: viewModel.currentCards?.player1, remaining: viewModel.status.player1Remaining.count)
                Spacer()
                PlayerView(playerName: "Player 2", card: viewModel.currentCards?.player2, remaining: viewModel.status.player2Remaining.count)
                Spacer()
            }
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

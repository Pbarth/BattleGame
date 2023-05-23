//
//  GameView.DealerView.swift
//  BattleGame
//
//  Created by Pierre BARTHELEMY on 22/05/2023.
//

import SwiftUI

extension GameView {
    struct DealerView: View {

        var viewModel: GameViewModel
        var canTurn: Bool = false
        
        var body: some View {
            VStack {
                Text("Dealer")
                Button("Start new game") {
                    viewModel.startNewGame()
                }
                
                if canTurn {
                    Button("Turn") {
                        viewModel.turn()
                    }
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct GameView_DealerView_Previews: PreviewProvider {
    static var previews: some View {
        GameView.DealerView(viewModel: GameViewModel())
    }
}

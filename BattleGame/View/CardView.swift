//
//  CardView.swift
//  BattleGame
//
//  Created by Pierre BARTHELEMY on 22/05/2023.
//

import SwiftUI

struct CardView: View {
    
    public var card: Card?
    
    var body: some View {
        if let current = card {
            Label("\(current.rank.rawValue)", systemImage: current.suit.symbolName)
                .font(.system(size: 24))
                .bold()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(suit: .diamond, rank: .five))
    }
}

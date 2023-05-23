//
//  Suit.swift
//  BattleGame
//
//  Created by Pierre BARTHELEMY on 23/05/2023.
//

import Foundation

enum Suit: CaseIterable {
    case spade
    case heart
    case club
    case diamond
    
    var symbolName: String {
        switch self {
        case .spade:
            return "suit.spade.fill"
        case .heart:
            return "suit.heart.fill"
        case .club:
            return "suit.club.fill"
        case .diamond:
            return "suit.diamond.fill"
        }
    }
}

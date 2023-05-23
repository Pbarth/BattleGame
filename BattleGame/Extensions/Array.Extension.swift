//
//  Array.Extension.swift
//  BattleGame
//
//  Created by Pierre BARTHELEMY on 22/05/2023.
//

import Foundation

extension Array where Element == Card {
    mutating func remove(card: Card) {
        self.removeAll(where: { $0.rank == card.rank && $0.suit == card.suit })
    }
}

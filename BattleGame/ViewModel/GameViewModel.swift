//
//  GameViewModel.swift
//  BattleGame
//
//  Created by Pierre BARTHELEMY on 22/05/2023.
//

import Foundation

public class GameViewModel: ObservableObject {
    
    @Published var currentCards: (player1: Card?, player2: Card?)?
    @Published var status: (player1Remaining: [Card], player2Remaining: [Card]) = (player1Remaining: [Card](), player2Remaining: [Card]())
    
    var canTurn: Bool = false
    
    private func generateDeck() -> [Card] {
        var deck: [Card] = [Card]()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                let card = Card(suit: suit, rank: rank)
                deck.append(card)
            }
        }
        return deck
    }
    
    private func updateStatus(newStatus: (player1Remaining: [Card], player2Remaining: [Card])) {
        status = newStatus
        canTurn = (status.player1Remaining.count > 0) && (status.player2Remaining.count > 0)
    }
    
    func startNewGame() {
        var deck: [Card] = generateDeck()
        
        deck.shuffle()
        let half = deck.count / 2
        let player1Cards = Array(deck[..<half])
        let player2Cards = Array(deck[half...])
        
        canTurn = true
        updateStatus(newStatus: (player1Remaining: player1Cards,
                                 player2Remaining: player2Cards))
    }
    
    func turn() {
        var newStatus = status
        if let player1Card = currentCards?.player1, let player2Card = currentCards?.player2 {
            if player1Card.rank.rawValue >= player2Card.rank.rawValue {
                newStatus.player2Remaining.remove(card: player2Card)
                newStatus.player1Remaining.remove(card: player1Card)
                newStatus.player1Remaining.append(contentsOf: [player1Card, player2Card])
            } else {
                newStatus.player1Remaining.remove(card: player1Card)
                newStatus.player2Remaining.remove(card: player2Card)
                newStatus.player2Remaining.append(contentsOf: [player2Card, player1Card])
            }
            updateStatus(newStatus: newStatus)
        }
        canTurn = (status.player1Remaining.count > 0) && (status.player2Remaining.count > 0)
        currentCards = (player1: status.player1Remaining.first, player2: status.player2Remaining.first)
    }
}

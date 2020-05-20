//
//  Concentration.swift
//  Concentration-learning-app
//
//  Created by Vasiliy Matveev on 19.05.2020.
//  Copyright © 2020 Vasiliy Matveev. All rights reserved.
//

import Foundation


class Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOndeAndOnlyFaceUpCard: Int? {
        
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concantration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOndeAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOndeAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concantration.init(at: \(numberOfPairsOfCards)):you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
        
    }
}

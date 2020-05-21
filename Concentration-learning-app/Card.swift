//
//  Card.swift
//  Concentration-learning-app
//
//  Created by Vasiliy Matveev on 19.05.2020.
//  Copyright © 2020 Vasiliy Matveev. All rights reserved.
//

import Foundation


struct Card: Hashable {
    var hashVaule: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
        
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

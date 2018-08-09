//
//  Card.swift
//  Concentration
//
//  Created by Md Ashraful Islam on 7/8/18.
//  Copyright © 2018 Md Ashraful Islam. All rights reserved.
//

import Foundation

/// Struct has no inharitence
/// Structs are value type Class are refence type
/// arrys, int, dictionaries all are structs

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

//
//  PlayingCard.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 5/22/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.
//
import Foundation

struct Card : Equatable {
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.cardColor == rhs.cardColor &&
            lhs.cardNumber == rhs.cardNumber &&
            lhs.cardShading == rhs.cardShading &&
            lhs.cardSymbol == rhs.cardSymbol
    }
    
    let cardColor: CardColor
    let cardSymbol: CardSymbol
    let cardNumber: CardNumber
    let cardShading: CardShading
}



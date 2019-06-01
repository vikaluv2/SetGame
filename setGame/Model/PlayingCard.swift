//
//  PlayingCard.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 5/22/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.


import Foundation

//equatable is gonna be made a duplicate
struct Card : Equatable {
    
    //protocol equatable
    //referenced from another's code
    
    
    /*static func ==(lhs: Card, rhs: Card) -> Bool { //always boolean
        return lhs.cardColor == rhs.cardColor &&
            lhs.cardNumber == rhs.cardNumber &&
            lhs.cardType == rhs.cardType && //comparison starts
            lhs.cardSymbol == rhs.cardSymbol
    }*/
    
    let cardColor: CardColor
    let cardSymbol: CardSymbol
    let cardNumber: CardNumber
    let cardType: CardType
}

//enums are only value types
enum CardColor {
    case red
    case green
    case purple
    
    static let allValues = [red, green, purple]
}

enum CardSymbol {
    case diamond
    case squiggle
    case oval
    
    static let allValues = [diamond, squiggle, oval]
}

enum CardNumber {
    case one
    case two
    case three
    
    static let allValues = [one, two, three]
}

enum CardType {
    case solid
    case striped
    case open
    
    static let allValues = [solid, striped, open]
}



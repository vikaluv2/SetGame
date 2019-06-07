//
//  SetCardDeck.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 6/7/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.
//

import Foundation

struct SetCardDeck {
    
    private(set) var cards: [SetCard]
    
    init() {
        cards = [SetCard]()
        for color in SetCard.Variant.all {
            for shape in SetCard.Variant.all {
                for shade in SetCard.Variant.all {
                    for number in SetCard.Variant.all {
                        cards.append(SetCard(color: color, shape: shape, shade: shade, number: number))
                    }
                }
            }
        }
    }
    
    mutating func draw() -> SetCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4Random)
        } else {
            return nil
        }
    }
    
}

extension Int {
    var arc4Random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

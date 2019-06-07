//
//  SetCard.swift
//  SetGame
//
//  Created by Christopher Slade on 6/4/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import Foundation

struct SetCard: Equatable, CustomStringConvertible {
    
    var color: Variant
    var shape: Variant
    var shade: Variant
    var number: Variant
    
    static func isAMatch(with card1: SetCard, and card2: SetCard, and card3: SetCard) -> Bool {
        return true
    }
    
    // MARK: Equatable
    
    static func ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return (lhs.color == rhs.color) && (lhs.shape == rhs.shape) && (lhs.shade == rhs.shade) && (lhs.number == rhs.number)
    }
    
    // MARK: CustomStringConvertible
    
    var description: String {
        return "Card(Color: \(color) Shape: \(shape) Shade: \(shade) Number: \(number))"
    }
    
    //MARK: - Internal Data Structure
    
    enum Variant: Int {
        case v1 = 1
        case v2 = 2
        case v3 = 3
        
        static var all: [Variant] {
            return [.v1,.v2,.v3]
        }
        
    }
}

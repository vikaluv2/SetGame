//
//  Button.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 5/29/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.
//

import Foundation
import UIKit

class Button{
    
    private static func getSymbol(ofCard card: Card) -> String {
        switch card.cardSymbol {
        case .diamond:
            return "▲"
        case .oval:
            return "●"
        case .squiggle:
            return "◼︎"
        }
    }
    
    //set color
    private static func getColor(ofCard card: Card) -> UIColor {
        switch card.cardColor {
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        case .purple:
            return UIColor.purple
        }
    }
    
    private static func getButtonTitle(ofCard card: Card, usingSymbol symbol: String) -> String {
        switch card.cardNumber {
        case .one:
            return symbol
        case .two:
            return "\(symbol) \(symbol)"
        case .three:
            return "\(symbol) \(symbol) \(symbol)"
        }
    }
    
    private static func getButtonAttributedTitle(ofCard card: Card, withTitle title: String, withColor color: UIColor) -> NSAttributedString {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        switch card.cardType {
        case .open:
            attributes[.strokeWidth] = 4
            attributes[.foregroundColor] = color
        case .solid:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color
        case .striped:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color.withAlphaComponent(0.25)
        }
        
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    public static func chosenCard(cardToChoose card: Card, onButton: UIButton, selectButton: Bool, isSet: Bool) {
        
        let buttonColor = getColor(ofCard: card)
        let cardSymbol = getSymbol(ofCard: card)
        let buttonTitle = getButtonTitle(ofCard: card, usingSymbol: cardSymbol)
        let attributedTitle = getButtonAttributedTitle(ofCard: card, withTitle: buttonTitle, withColor: buttonColor)
        
        onButton.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        if selectButton {
            if isSet {
                onButton.select(borderColor: #colorLiteral(red: 1, green: 0.4353730381, blue: 0.7914764285, alpha: 1)) //if matched
            } else {
                onButton.select()
            }
        } else {
            onButton.deselect()
        }
    }
}


//extension for how the buttons selection attriutes look like
extension UIButton {
    
    func IsSelected() -> Bool {
        return self.layer.borderWidth == 2.0
    }
    
    func select(borderColor: UIColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)) {
        self.layer.borderWidth = 4.0
        self.layer.borderColor = borderColor.cgColor
        self.layer.backgroundColor = #colorLiteral(red: 0.9953911901, green: 0.9881951213, blue: 1, alpha: 1)
    }
    
    func deselect() { //not a match
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.backgroundColor = #colorLiteral(red: 0.9613568187, green: 0.9384984374, blue: 0.9079746604, alpha: 1)
    }
}

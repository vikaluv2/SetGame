//
//  SetCardGame.swift
//  SetGame
//
//  Created by Christopher Slade on 6/4/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import Foundation

struct SetCardGame {
    //DA LOGIC
    
    private var deck = SetCardDeck()
    private(set) var cardsInPlay = [SetCard]()
    private(set) var selectedCards = [SetCard]()
    private(set) var score = 0
    
    private static let initialCardCount = 12 //always start
    
    init() {
        for _ in 0..<SetCardGame.initialCardCount {
            cardsInPlay.append(deck.draw()!)
        }
    }
    
    var isMatch: Bool {
        
            return true
        }
        //
        
        //
        //TODO write code that checks if the current select is a match or not. Return true if it is.
        return false
    
    mutating func selectCard(at index: Int) {
        //if selectedCards  {
        //
        //        }
        //the view will call this when the user taps on a card
        //You should add code that decides what it means when this card is selected
    }
    
    mutating func deal3Cards() {
        _ = deck.draw()
        
        //if you can, deal 3 more cards into play
        //SHOULD NOT check for 24 cards, that's a view thing
    }
    
    func isSelectedCard(_ card: SetCard) -> Bool {
        return selectedCards.contains(card)
    }
    
}

    func deselect(for card: UIButton){
        if SetCard.is {
            
        }
}


extension Array where Element: Equatable {
    mutating func inOrOut(element: Element) {
        if let pos = self.firstIndex(of: element) {
            self.remove(at: pos)
        } else {
            self.append(element)
        }
    }
    
    mutating func remove(element: Element) {
        if let pos = self.firstIndex(of: element) {
            self.remove(at: pos)
        }
    }
}


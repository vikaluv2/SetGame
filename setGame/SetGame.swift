//
//  SetGame.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 5/22/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.
//
//

import Foundation

class SetGame {
    var availableCards = [Card]()
    var cardsInGame = [Card]()
    var selectedCards = [Card]()
    
    var score = 0
    
    init() {
        newGame()
    }
    
    //This will reset the game -
    func newGame() {
        score = 0
        availableCards.removeAll() //removes all cards
        cardsInGame.removeAll()
        selectedCards.removeAll()
        addCards(numberOfCardsToSelect: 12)
        
    }
    

    
    private func addCard() {
        let selectedCard = availableCards.remove(at: availableCards.count.arc4Random())
        cardsInGame.append(selectedCard)
    }
    
    func addCards(numberOfCardsToSelect numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            addCard()
        }
    }
    
    func cardIsSelected(card: Card) -> Bool {
        return selectedCards.index(of: card) != nil
    }
    
    func isSet() -> Bool {
        
        if selectedCards.count != 3 {
            return false
        }
        
        return true
    }
    
    func select(card: Card) {
        if selectedCards.count == 3 && isSet() {
            selectedCards.forEach {
                if let selectedCardInGameIndex = cardsInGame.index(of: $0) {
                    cardsInGame.remove(at: selectedCardInGameIndex)
                    if availableCards.count > 0 {
                        let selectedCard = availableCards.remove(at: availableCards.count.arc4Random())
                        cardsInGame.insert(selectedCard, at: selectedCardInGameIndex)
                    }
                }
            }
            selectedCards.removeAll()
            score += 3
        } else if selectedCards.count == 3 && !isSet() {
            selectedCards.removeAll()
            score -= 1
        }
        
        if let cardToSelect = selectedCards.index(of: card) {
            selectedCards.remove(at: cardToSelect) //removes it when selected if not needed
        } else {
            selectedCards.append(card)
        }
    }
}

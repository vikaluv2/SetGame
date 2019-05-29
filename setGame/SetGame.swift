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
    
    //This will reset the game
    func newGame() {
        score = 0
        availableCards.removeAll() //removes all cards
        cardsInGame.removeAll()
        selectedCards.removeAll()
        
        generateAllCardCombinations()
        addCards(numberOfCardsToSelect: 12)
        
    }
    
    private func generateAllCardCombinations() {
        for color in CardColor.allValues {
            for symbol in CardSymbol.allValues {
                for number in CardNumber.allValues {
                    for shading in CardType.allValues {
                        let card = Card(cardColor: color, cardSymbol: symbol, cardNumber: number, cardType: shading)
                        availableCards.append(card)
                    }
                }
            }
        }
    }
    

    
    private func addCard() { //makes it random the added cards
        let selectedCard = availableCards.remove(at: availableCards.count.arc4Random())
        cardsInGame.append(selectedCard) //appends for
    }
    
    func addCards(numberOfCardsToSelect numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            addCard()
        }
    }
    
    func cardIsSelected(card: Card) -> Bool {
        return selectedCards.index(of: card) != nil //not null bc selected
    }
    
    //THIS IS HOW THE GAME works
    func isSet() -> Bool {
        if selectedCards.count != 3 { //not 3, dont do anything
            return false
        }
        
        //scenario 1
        if selectedCards[0].cardColor == selectedCards[1].cardColor {
            if selectedCards[0].cardColor != selectedCards[2].cardColor {
                return false
            }
        } else if selectedCards[1].cardColor == selectedCards[2].cardColor {
            return false
        } else if (selectedCards[0].cardColor == selectedCards[2].cardColor) {
            return false
        }
        //
        if selectedCards[0].cardNumber == selectedCards[1].cardNumber {
            if selectedCards[0].cardNumber != selectedCards[2].cardNumber {
                return false
            }
        } else if selectedCards[1].cardNumber == selectedCards[2].cardNumber {
            return false
        } else if (selectedCards[0].cardNumber == selectedCards[2].cardNumber) {
            return false
        }
        //
        if selectedCards[0].cardType == selectedCards[1].cardType {
            if selectedCards[0].cardType != selectedCards[2].cardType {
                return false
            }
        } else if selectedCards[1].cardType == selectedCards[2].cardType {
            return false
        } else if (selectedCards[0].cardType == selectedCards[2].cardType) {
            return false
        }
        //
        if selectedCards[0].cardSymbol == selectedCards[1].cardSymbol {
            if selectedCards[0].cardSymbol != selectedCards[2].cardSymbol {
                return false
            }
        } else if selectedCards[1].cardSymbol == selectedCards[2].cardSymbol {
            return false
        } else if (selectedCards[0].cardSymbol == selectedCards[2].cardSymbol) {
            return false
        }
        
        return true
    }
    
    
    //selecting the card
    func select(card: Card) {
        if selectedCards.count == 3 && isSet() { //is a match
            selectedCards.forEach {
                if let selectedCardInGameIndex = cardsInGame.index(of: $0) {
                    cardsInGame.remove(at: selectedCardInGameIndex) //removes the matched cards
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
        
        if let card2Select = selectedCards.index(of: card) {
            selectedCards.remove(at: card2Select) //removes it when selected if not needed
        } else {
            selectedCards.append(card)
        }
    }
}

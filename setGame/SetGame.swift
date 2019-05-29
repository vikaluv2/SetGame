//
//  SetGame.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 5/28/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.
//

import Foundation

class SetGame {
    //Variables
    var deskCards = [SetCard?]()
    private var deck = SetCardDeck()
    private(set) var score = 0
    private var matchedCards = [SetCard]()
    
    //Constants
    let startCards: Int
    let maxCards: Int
    
    //Computed Properties
    private var positionsHaveCards: [Bool] {
        return deskCards.map({ $0 != nil })
    }
    
    private var selectedCards: [SetCard] {
        get { return deskCards.filter({ $0?.isChose == true }).map({ $0! }) }
        set {
            for index in deskCards.indices {
                if deskCards[index] != nil {
                    deskCards[index]!.isChose = newValue.contains(where: { $0 == deskCards[index]! })
                }
            }
        }
    }
    var hasThreeMoreCards: Bool {
        return deck.cards.count >= 3
    }
    
    //Initializer
    init(startCards start: Int, maxCards max: Int) {
        startCards = start
        maxCards = max
        new(startNumberOfCards: startCards, maxNumberOfCards: max)
    }
    
    //Methods
    
    func chooseCard(at position: Int) {
        assert(position >= 0, "SetGame.chooseCard: position(\(position) must is not negative.")
        deskCards[position]!.isChose = !deskCards[position]!.isChose
        if selectedCards.count == 3 { // 3 card is selected
            if selectedCards.isValidAttribute({ $0.color == $1.color }) &&
                selectedCards.isValidAttribute({ $0.symbol == $1.symbol }) &&
                selectedCards.isValidAttribute({ $0.number == $1.number }) &&
                selectedCards.isValidAttribute({ $0.shading == $1.shading }){
                for card in selectedCards {
                    if let matchedCard = deskCards[deskCards.index(where: { $0 == card})!] {
                        deskCards[deskCards.index(where: { $0 == card})!] = nil
                        matchedCards.append(matchedCard)
                    }
                }
                print("match")
                score += 1
            } else {
                // TODO: mismatch
                selectedCards = []
                print("mismatch")
            }
        }
    }
    
    func new(startNumberOfCards start: Int, maxNumberOfCards max: Int) {
        // reset
        deck.reset()
        matchedCards.removeAll()
        score = 0
        deskCards = Array<SetCard?>(repeating: nil, count: max)
        // new game
        drawCard(count: start)
    }
    
    private func drawCard(count: Int = 1) {
        assert(count > 0, "SetGame.drawCard: count(\(count)) must at least 1.")
        for _  in 0..<count {
            if let card = deck.getCard(), let position = randomAvailablePosition() {
                deskCards[position] = card
            } else {
                NSLog("No more cards to draw into deskCards.")
                break
            }
        }
    }
    
    private func randomAvailablePosition() -> Int? {
        var availablePosIndices = [Int]()
        for index in positionsHaveCards.indices {
            if !positionsHaveCards[index] {
                availablePosIndices.append(index)
            }
        }
        if availablePosIndices.isEmpty { //fill it in
            return nil
        } else {
            return availablePosIndices[availablePosIndices.count.arc4random]
        }
    }
    
    //draws 3 more
    func dealThreeMoreCard() {
        drawCard(count: 3)
    }
    
    // Constants
    private typealias Symbol = SetCard.Attribute
    private typealias Number = SetCard.Attribute
    private typealias Shading = SetCard.Attribute
    private typealias Color = SetCard.Attribute
    
    // the Deck
    private struct SetCardDeck {
        private(set) var cards = [SetCard]()
        mutating func reset() {
            cards.removeAll()
            for color in SetGame.Color.all {
                for symbol in SetGame.Symbol.all {
                    for number in SetGame.Number.all {
                        for shading in SetGame.Shading.all {
                            cards.append(SetCard(color: color, symbol: symbol, shading: shading, number: number))
                        }
                    }
                }
            }
        }
        
        mutating func getCard() -> SetCard? {
            guard !cards.isEmpty else {
                return nil
            }
            return cards.removeFirst() // for test
            //            return cards.remove(at: cards.count.arc4random)
        }
        
        init() {
            reset()
        }
    }
}





extension Array {
    func isValidAttribute(_ compare: (Element, Element) -> Bool) -> Bool {
        var same = true
        var diff = true
        for i in self.indices {
            for j in i..<self.count {
                if i != j {
                    same = same && compare(self[i], self[j])
                    diff = diff && !compare(self[i], self[j])
                }
            }
        }
        return same || diff
    }
}

extension Int {
    var arc4random: Int {
        switch self {
        case let number where number > 0:
            return +Int(arc4random_uniform(UInt32(+self)))
        case let number where number < 0:
            return -Int(arc4random_uniform(UInt32(-self)))
        default:
            return 0
        }
    }
}

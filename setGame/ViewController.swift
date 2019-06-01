//
//  AppDelegate.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 5/22/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var setCardButtons: [UIButton]!
    
    @IBOutlet weak var dealThreeMoreCardsButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    let setGame = SetGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButtons()
        updateViewFromModel()
    }
    
    func resetButtons() { //attributes of buttons that will come up
        for buttonIndex in setCardButtons.indices {
            let button = setCardButtons[buttonIndex]
            button.deselect()
            button.layer.cornerRadius = 8.0 //from hint
            button.titleLabel?.font = UIFont.systemFont(ofSize: 28.0) //part of hint
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
            button.layer.borderColor =  #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0) //its there but you csnt see it until you draw the card
            button.setAttributedTitle(nil, for: UIControl.State.normal)
        }
    }
    
    
    
    @IBAction private func selectCard(_ sender: UIButton) {
        if let cardIndex = setCardButtons.index(of: sender) { //that card
            if cardIndex < setGame.cardsInGame.count { //the number of cards
                setGame.select(card: setGame.cardsInGame[cardIndex])
            }
            updateViewFromModel()
        }
    }
    
    @IBAction func newGame() {
        dealThreeMoreCardsButton.isEnabled = true
        setGame.newGame()
        resetButtons()
        updateViewFromModel()
    }
    
    @IBAction func addThreeNewCards() {
        setGame.addCards(numberOfCardsToSelect: 3) //adds 3 cards at a time else crash
        updateViewFromModel()
        if setGame.cardsInGame.count >= 24 { //24 cards total to display but the deck is
            dealThreeMoreCardsButton.isEnabled = false //cant
        }
    }

    private func updateViewFromModel() {
        var cardButtonin = 0
        resetButtons()
        scoreLabel.text = "Score: \(setGame.score)"
        for card in setGame.cardsInGame {
            let button = setCardButtons[cardButtonin]
            Button.chosenCard(cardToChoose: card,
                                    onButton: button,
                                    selectButton: setGame.cardIsSelected(card: card),
                                    isSet: setGame.isSet())
            cardButtonin += 1 //implementing by 1
        }
    }
}

//copied from lec 2 concentration
extension Int { //whatever Int will randomize
    func arc4Random() -> Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

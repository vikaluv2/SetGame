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
    
    @IBOutlet weak var dealButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    let setGame = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButtons()
        updateViewFromModel()
    }
    
    func resetButtons() { //attributes of the buttons
        for buttonIndex in setCardButtons.indices {
            let button = setCardButtons[buttonIndex]
            button.deselect()
            button.titleLabel?.font = UIFont.systemFont(ofSize: 28.0) //size of chars
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0) //makes card (color) there but its invisible
            button.layer.borderColor =  #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0) //border is clear too
            button.setAttributedTitle(nil, for: UIControl.State.normal)
        }
    }
    
    @IBAction private func selectCard(_ sender: UIButton) {
        if let cardIndex = setCardButtons.index(of: sender) {
            if cardIndex < setGame.cardsInGame.count {
                setGame.select(card: setGame.cardsInGame[cardIndex])
            }
            updateViewFromModel()
        }
    }
    
    @IBAction func newGame() {
        dealButton.isEnabled = true
        setGame.newGame()
        resetButtons()
        updateViewFromModel()
    }
    
    @IBAction func addThreeCards() {
        setGame.addCards(numberOfCardsToSelect: 3)
        updateViewFromModel()
        if setGame.cardsInGame.count >= 24 {
            dealButton.isEnabled = false
        }
    }
    
    private func updateViewFromModel() {
        var cardButtonIndex = 0
        resetButtons()
        scoreLabel.text = "Score: \(setGame.score)" //keeps track of the score
        for card in setGame.cardsInGame {
            let button = setCardButtons[cardButtonIndex]
            ButtonRender.chosenCard(cardToChoose: card,
                                    onButton: button,
                                    selectButton: setGame.cardIsSelected(card: card),
                                    isSet: setGame.isSet())
            cardButtonIndex += 1
        }
    }
}


extension Int {
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

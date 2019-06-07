//
//  ViewController.swift
//  SetGame
//
//  Created by Christopher Slade on 6/4/19.
//  Copyright © 2019 Christopher Slade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = SetCardGame()
    
    private var Score //game score
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var DealThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            if index < game.cardsInPlay.count {
                cardButtons[index].alpha = 1
                update(cardButton: cardButtons[index], with: game.cardsInPlay[index])
            } else {
                cardButtons[index].alpha = 0
            }
            
            Score = 0;
            for index in cardButtons.indices{
                
                if
            }
            // for each card button on the UI do the following
            // if the model has a card at that position {
            //make card appear
            //make card look like the card in the model by calling
            //update(cardButton: cardButtons[index], with: game.cardsInPlay[index])
            // } else {
            //make card disappear
            //}
            //update the score
        }
    }
    
    //you will want to connect your card buttons to this method
    @IBAction func cardTapped(_ sender: UIButton) {
        //find out with cardButton was tapped
        //tell the game to select that card
        updateViewFromModel()
    }
    
    //you will want to connect your deal button to this method
    @IBAction func dealPressed() {
        //make sure you won't overfill your UI
        //IF not tell the game to deal 3 cards
        updateViewFromModel()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = SetCardGame()
        updateViewFromModel()
        
        
    }
    //    private func newSetCardGame() -> SetCardGame {
    //        return SetCardGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    //    }
    
    private func update(cardButton: UIButton, with card: SetCard) {
        var buttonTitle = ""
        var color = UIColor.white
        switch card.shape {
        case.v1:
            buttonTitle = "▲"
        case.v2:
            buttonTitle = "●"
        case.v3:
            buttonTitle = "■"
        }
        
        switch card.number {
        case.v1:
            break
        case.v2:
            buttonTitle = buttonTitle + buttonTitle
        case.v3:
            buttonTitle = buttonTitle + buttonTitle + buttonTitle
        }
        switch card.color {
        case.v1:
            color = UIColor.blue
        case.v2:
            color = UIColor.red
        case.v3:
            color = UIColor.green
        }
        let attributes: [NSAttributedString.Key : Any] = [
            .strokeColor : color,
            .strokeWidth : 5.0
            
        ]
        
        cardButton.setAttributedTitle(NSAttributedString(string: buttonTitle, attributes: attributes), for: .normal)
        
        //In here you will have 4 switch statements to update the button to match the card
        //You will also need to update the buttons selection ...
        //If the card is select, draw a border around the cardButton
        //else remove the border around the button.
    }
    
    
    
    
}

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
    let cardz = game.cards[index]
    
    private var Score = 0 //game score
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var DealThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices { //ALLOWS CARD TO SHOW WHEN FLIPPED
            if index < game.cardsInPlay.count {
                cardButtons[index].alpha = 1 //transparent totally see through
                update(cardButton: cardButtons[index], with: game.cardsInPlay[index])
            } else {
                cardButtons[index].alpha = 0 //sets opaque of the card-0 means totally covers view
            }
            for index in cardButtons.indices{ // for each card button on the UI do the following
                if game.cardsInPlay  {// if the model has a card at that position
                
                }
            //make card appear
            }
            //make card look like the card in the model by calling
            update(cardButton: cardButtons[index], with: game.cardsInPlay[index])
        } else do{
            
            // make card disappear
            }
           Score+=3
           updateScore()
            //update the score //increments by 3
    }

    private func updateScore() {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
            .strokeWidth: 5
        ]
        let attributedText = NSAttributedString(string: "Flips: \(Score)", attributes: attributes)
        ScoreLabel.attributedText = attributedText
    }
    
     //you will want to connect your card buttons to this method
    @IBAction func cardTapped(_ sender: UIButton) {
        //find out with cardButton was tapped
        //tell the game to select that card
        if let cardTouch = cardButtons.index(of: sender){
            if !game.cards[cardTouch].isAMatch {
                game.chooseCard(at: cardNumber)
                updateViewFromModel() //look at the cards and see if they match
            }
        }else{
            print("chosen card was not in cardButtons")
        }
        
    }
            
    //you will want to connect your deal button to this method
    @IBAction func dealPressed() {
        for index in cardButtons.indices {
            
        //make sure you won't overfill your UI
        //IF not tell the game to deal 3 cards
        card.deal3Cards()
        updateViewFromModel()
    }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = SetCardGame()
        updateViewFromModel()
        
    }
        
    //    private func newSetCardGame() -> SetCardGame {
    //        return SetCardGame(numberOfPairsOfCards: (cardButtons.count + 1) / 3)
    //    }
            
    private func updateCardButton(for card: UIButton, withColor color: UIColor) {
        //card.setTitle(emoji, for: UIControl.State.normal)
        card.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
            }
    
    
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
        
        }
    
        //In here you will have 4 switch statements to update the button to match the card
        //You will also need to update the buttons selection ...
    for index in cardButton[indices]{
        if cardz.isSelected == true{
            //If the card is select, draw a border around the cardButton
            cardButton.layer.borderWidth = 3.0
            cardButton.layer.borderColor = UIColor
            cardButton.layer.cornerRadius = 8.0
        }else {
            //else remove the border around the button.
            cardButton.layer.borderWidth = 0.0
        }
    }
    
}

    


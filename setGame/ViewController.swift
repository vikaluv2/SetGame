//
//  ViewController.swift
//  setGame
//
//  Created by Vika Maopa Toloke on 5/28/19.
//  Copyright © 2019 Vika Maopa Toloke. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    // MARK: - Model
    private lazy var game: SetGame = {
        var game = SetGame(startCards: startCards, maxCards: cardButtons.count)
        return game
    }()
    
    private let startCards = 12
    private lazy var currentCards = startCards
    private var score = 0 {
        didSet {
            scoreLabel?.text = "Score: \(score)"
        }
    }
    private var selectedCards = [SetCard]()
    private lazy var vailablePositions = {
        return Array<Bool>(repeating: false, count: cardButtons.count)
    }()
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Outlet
    @IBOutlet private weak var scoreLabel: UILabel! {
        didSet {
            scoreLabel?.text = "Score: \(score)"
        }
    }
    @IBOutlet private var cardButtons: [UIButton]! {
        didSet {
            updateUI()
        }
    }
    @IBOutlet weak var situationLabel: UILabel!
    
    @IBOutlet weak var dealThreeMoreCardsButton: UIButton! { didSet { updateUI() } }
    
    // MARK: - Action
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            score = game.score
            updateUI()
        }
    }
    @IBAction private func newGame() {
        game.new(startNumberOfCards: startCards, maxNumberOfCards: cardButtons.count)
        updateUI()
    }
    @IBAction private func dealThreeMoreCards() {
        if vailablePositions.filter({ $0 }).count >= 3 {
            game.dealThreeMoreCard()
            updateUI()
        }
    }
    
    // MARK: - UI
    private func updateUI() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            if let card = game.deskCards[index] { // has card
                // draw picture
                button.isEnabled = true
                button.setAttributedTitle(draw(by: card), for: .normal)
                button.layer.borderWidth = 2
                button.backgroundColor = UIColor.white
                if card.isChose {
                    button.isEnabled = true
                    button.layer.borderColor = UIColor.blue.cgColor
                } else {
                    button.isEnabled = true
                    button.layer.borderColor = UIColor.white.cgColor
                }
                vailablePositions[index] = false
            } else { // no card
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                button.layer.borderWidth = 0
                button.isEnabled = false
                button.setAttributedTitle(nil, for: .normal)
                vailablePositions[index] = true
            }
        }
        // TODO: add game situation
        score = game.score
        dealThreeMoreCardsButton.isEnabled = vailablePositions.filter({ $0 }).count >= 3 && game.hasThreeMoreCards
    }
    
    private func draw(by card: SetCard) -> NSAttributedString {
        // set symbol
        let symbol = DrawAttributes[AttributeKey.Symbol]![card.symbol.rawValue] as! String
        let number = DrawAttributes[AttributeKey.Number]![card.number.rawValue] as! Int
        let picture = symbol.multiple(times: number)
        
        // set attributes
        var attributes = [NSAttributedString.Key: Any]()
        let colorWithAlpha = UIColor.withAlphaComponent(DrawAttributes[AttributeKey.Color]![card.color.rawValue] as! UIColor)
        let alpha = CGFloat(DrawAttributes[AttributeKey.Shading]![card.shading.rawValue] as! Double)
        if alpha == 0 {
            attributes[.strokeColor] = colorWithAlpha(1)
            attributes[.strokeWidth] = 3
        } else {
            let striped = colorWithAlpha(alpha)
            attributes[.foregroundColor] = striped
        }
        return NSAttributedString(string: picture, attributes: attributes)
    }
    
    private struct AttributeKey {
        static let Color = "color"
        static let Symbol = "symbol"
        static let Shading = "shading"
        static let Number = "number"
    }
    
    private var DrawAttributes: [String : [Any]] = [
        AttributeKey.Color : [UIColor.red, UIColor.green, UIColor.blue],
        AttributeKey.Symbol : ["▲", "●", "■"],
        AttributeKey.Shading : [1.0, 0.15, 0.0],
        AttributeKey.Number : [1, 2, 3]
    ]
    
}

extension String {
    func multiple(times: Int) -> String {
        var str = ""
        for _ in 0..<times {
            str.append(self)
        }
        return str
    }
}

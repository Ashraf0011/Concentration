//
//  ViewController.swift
//  Concentration
//
//  Created by Md Ashraful Islam on 7/8/18.
//  Copyright © 2018 Md Ashraful Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    var flipCount: Int = 0 { didSet { scoreLabel.text = "Score: \(self.flipCount)" }} // this is called property observer
   
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
          flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
           game.chooseCard(at: cardNumber)  // flipCard(withEmoji: emojiChoises[cardNumber], on: sender)
            updateViewFormModel()
        } else {
            print("card was not configured ")
        }
    }
   
    func updateViewFormModel(){
        for index in cardButtons.indices { // mathod in array return to a countable range of all the indexes in the array
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)   // made card transparent if matched
            }
        }
    }
    
    var emojiChoises = ["🤯","👻","😺","🐲","⛄️","☠️","🤡","🐉"]
    var emoji = [Int : String]()
    
    func emoji(for card: Card ) -> String {
        if emoji[card.identifier] == nil, emojiChoises.count > 0 {
            let randomIndex = Int( arc4random_uniform(UInt32(emojiChoises.count)))
            emoji[card.identifier] = emojiChoises.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}


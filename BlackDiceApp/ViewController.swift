//
//  ViewController.swift
//  BlackDiceApp
//
//  Created by Dilara Elçioğlu on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var diceImage2: UIImageView!
    
    let dice1 = UIImage(imageLiteralResourceName: "dice-one")
    let dice2 = UIImage(imageLiteralResourceName: "dice-two")
    let dice3 = UIImage(imageLiteralResourceName: "dice-three")
    let dice4 = UIImage(imageLiteralResourceName: "dice-four")
    let dice5 = UIImage(imageLiteralResourceName: "dice-five")
    let dice6 = UIImage(imageLiteralResourceName: "dice-six")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImage1.image = dice6
        diceImage2.image = dice6
        diceImage1.tintColor = .label
        diceImage2.tintColor = .label
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rollDice))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func rollDice() {
        let diceArray = [dice1,dice2,dice3,dice4,dice5,dice6]
        let animationArray : [UIView.AnimationOptions] = [
            .transitionFlipFromTop,
            .transitionFlipFromLeft,
            .transitionFlipFromRight,
            .transitionFlipFromBottom
        ]
        
        let animationDuration = 0.15

        let randomInt1 = Int.random(in: 0...5)
        let randomInt2 = Int.random(in: 0...5)
        
        UIView.transition(with: diceImage2,
                          duration: animationDuration,
                          options: animationArray[Int.random(in: 0...3)]) { [weak self] in
            guard let self = self else { return }
            self.diceImage2.image = diceArray [randomInt2]
        }
        
        UIView.transition(with: diceImage1,
                          duration: animationDuration,
                          options: animationArray[Int.random(in: 0...3)]) { [weak self] in
            guard let self = self else { return }
            self.diceImage1.image = diceArray [randomInt1]
        }
                
        let numDice1 = randomInt1+1
        let numDice2 = randomInt2+1        
        totalLabel.text = "Total: \(numDice1+numDice2)"
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            rollDice()
        }
    }
}


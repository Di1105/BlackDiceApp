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
    
    var dice1 = UIImage(imageLiteralResourceName: "dice1")
    var dice2 = UIImage(imageLiteralResourceName: "dice2")
    var dice3 = UIImage(imageLiteralResourceName: "dice2")
    var dice4 = UIImage(imageLiteralResourceName: "dice4")
    var dice5 = UIImage(imageLiteralResourceName: "dice5")
    var dice6 = UIImage(imageLiteralResourceName: "dice6")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImage1.image = UIImage(named: "dice6")
        diceImage2.image = UIImage(named: "dice6")

        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollDice))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func scrollDice() {
        let diceArray = [dice1,dice2,dice3,dice4,dice5,dice6,]

        let randomInt1 = Int.random(in: 0...5)
        let randomInt2 = Int.random(in: 0...5)
        diceImage1.image = diceArray [randomInt1]
        diceImage2.image = diceArray [randomInt2]
        
        let numDice1 = randomInt1+1
        let numDice2 = randomInt2+1        
        totalLabel.text = "Total: \(numDice1+numDice2)"
    

    }

}


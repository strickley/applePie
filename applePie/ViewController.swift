//
//  ViewController.swift
//  applePie
//
//  Created by admin on 7/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    //change style in attributes inspector to Default, not Plain
    @IBOutlet var letterButtons: [UIButton]!
    
    //MARK: - Instance Properties
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent","bug", "program", "cheese"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    var currentGame: Game!
    
    //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        //In the course, this is build before the function newRound() is declared, we can build that out under instance methods to avoid the error.
        newRound()
    }
    
    
    //MARK: - IB Actions
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    
    //MARK: - Instance Methods

    //starts a new found of the game
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
   
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins) | Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}


//whatever I name my file is what I will name my struct



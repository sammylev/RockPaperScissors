//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Sammy Murray on 6/18/21.
//

import UIKit

enum Choice: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func opponent() -> Choice {
        let option = Int.random(in: 0...2)
        let hand = ["Rock", "Paper", "Scissors"]
        return Choice(rawValue: hand[option])!
    }
}

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    var user: Choice!
    let opponent: Choice = Choice.opponent()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        playGame()
    }
    
    func playGame () {
        var results: String
        var image = "itsATie"
        
        switch (user, opponent) {
        case (.Paper, .Scissors),(.Rock, .Paper),(.Scissors, .Rock):
            results = "Opponent wins"
            image = "\(opponent.rawValue)\(user.rawValue)"
        case (.Scissors,.Paper),(.Paper,.Rock),(.Rock,.Scissors):
            results = "You win"
            image = "\(user.rawValue)\(opponent.rawValue)"
        default:
            results = "You tied"
            image = "itsATie"
        }
        
        resultImage.image = UIImage(named: image)
        resultLabel.text = results
    }
    
    @IBAction func playAgain() {
        dismiss(animated: true, completion: nil)
    }


}


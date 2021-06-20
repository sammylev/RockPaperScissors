//
//  PlayViewController.swift
//  RockPaperScissors
//
//  Created by Sammy Murray on 6/18/21.
//

import UIKit

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender) 
    }
    
    @IBAction func playRock(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        view.user = userSelect(sender)
        present(view, animated: true,completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! ResultsViewController
        view.user = userSelect(sender as! UIButton)    
    }
    
    func userSelect(_ sender: UIButton) -> Choice {
        let option = sender.tag
        let hand = ["Rock", "Paper", "Scissors"]
        return Choice(rawValue: hand[option])!
    }


}

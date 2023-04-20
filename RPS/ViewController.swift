//
//  ViewController.swift
//  RPS
//
//  Created by Антон Адамсон on 03.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(forState: .start)
    }
    
    @IBAction func rockChoose(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @IBAction func scissorChoose(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @IBAction func paperChoose(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .gray
            signLabel.text = "🤡"
            
            playAgainButton.isHidden = true
            
            rockButton.isHidden = false
            scissorButton.isHidden = false
            paperButton.isHidden = false
            
            rockButton.isEnabled = true
            scissorButton.isEnabled = true
            paperButton.isEnabled = true
            
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
        case .draw:
            view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
        }
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        let gameState = userSign.gameState(against: computerSign)
        
        updateUI(forState: gameState)
        signLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        scissorButton.isHidden = true
        paperButton.isHidden = true
        
        rockButton.isEnabled = false
        scissorButton.isEnabled = false
        paperButton.isEnabled = false
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .scissors:
            scissorButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }
}


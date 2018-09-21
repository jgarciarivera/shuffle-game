//  ViewController.swift
//  PA1Team5
//
//  Created by Jorge Garcia-Rivera, Kristian Galvan, Luis Flores, Snehil Maknojia, and Geron Adams on 9/20/18.
//  Copyright © 2018 cpl.ubicomp. All rights reserved.

import UIKit

class ViewController: UIViewController, HighScoreDelegate {
    
    var highScore:Int = 0
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBAction func buttonStartGame(_ sender: Any) {
        performSegue(withIdentifier: "mainToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mainToGame") {
            let segueStartGame = segue.destination as! GameViewController
            segueStartGame.delegate = self
        }
    }
    
    func updateHighScore(updatedHighScore: Int) {
        if (updatedHighScore > highScore) {
            highScore = updatedHighScore
            highScoreLabel.text = String(updatedHighScore)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


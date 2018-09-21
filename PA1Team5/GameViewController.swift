//  GameViewController.swift
//  PA1Team5
//
//  Created by Ubicomp Team 5 on 9/20/18.
//  Copyright © 2018 cpl.ubicomp. All rights reserved.

import UIKit

protocol HighScoreDelegate {
    func updateHighScore(updatedHighScore: Int)
}

class GameViewController: UIViewController {
    
    var highScore: Int = 0
    var currentScore: Int = 0
    var mostFrequentColor: String?
    var hasBeenShuffled = false
    var delegate: HighScoreDelegate?
    let gemsList = ["blue", "green", "red", "yellow", "box"]
    var gemsCount: [Int] = [0,0,0,0,0]
    var gemSlots: Array<UIImageView> = []
    
    @IBOutlet weak var gemSlot0: UIImageView!
    @IBOutlet weak var gemSlot1: UIImageView!
    @IBOutlet weak var gemSlot2: UIImageView!
    @IBOutlet weak var gemSlot3: UIImageView!
    @IBOutlet weak var gemSlot4: UIImageView!
    @IBOutlet weak var gemSlot5: UIImageView!
    @IBOutlet weak var gemSlot6: UIImageView!
    @IBOutlet weak var gemSlot7: UIImageView!
    @IBOutlet weak var gemSlot8: UIImageView!
    @IBOutlet weak var gemSlot9: UIImageView!
    @IBOutlet weak var gemSlot10: UIImageView!
    @IBOutlet weak var gemSlot11: UIImageView!
    @IBOutlet weak var gemSlot12: UIImageView!
    @IBOutlet weak var gemSlot13: UIImageView!
    @IBOutlet weak var gemSlot14: UIImageView!
    @IBOutlet weak var gemSlot15: UIImageView!
    
    @IBAction func buttonShuffle(_ sender: UIButton) {
        currentScore = 0
        hasBeenShuffled = true
        for gemSlot in gemSlots {
            gemSlot.image =  getImage(number: Int(arc4random_uniform(5)))
            updateScore(gemSlot)
        }
        mostFrequentColor = gemsList[gemsCount.index(of: gemsCount.max()!)!]
        updateHighScore();
        delegate?.updateHighScore(updatedHighScore: highScore)
    }
    
    @IBAction func buttonViewStats(_ sender: Any) {
        if (hasBeenShuffled) {
            performSegue(withIdentifier: "gameToStats", sender: self)
        } else {
            let alert = UIAlertController(title: "Invalid Action", message: "Can't go to Statistics without the Shuffle action", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in alert.dismiss(animated: true, completion: nil) }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gameToStats") {
            let segueStats = segue.destination as! ScoreViewController
            segueStats.currentScore = currentScore
            segueStats.mostFrequentColor = mostFrequentColor!
        }
    }
    
    func getImage(number: Int) -> UIImage {
        return UIImage(named: gemsList[number])!
    }

    func updateScore(_ gem: UIImageView) {
        if (gem.image == UIImage(named: gemsList[0])) {
            currentScore = currentScore +  1
            gemsCount[0] += 1
        } else if (gem.image == UIImage(named: gemsList[1])) {
            currentScore = currentScore +  2
            gemsCount[1] += 1
        } else if (gem.image == UIImage(named: gemsList[2])) {
            currentScore = currentScore +  3
            gemsCount[2] += 1
        } else if (gem.image == UIImage(named: gemsList[3])) {
            currentScore = currentScore +  4
            gemsCount[3] += 1
        } else if (gem.image == UIImage(named: gemsList[4])) {
            currentScore = currentScore +  5
            gemsCount[4] += 1
        }
    }
    
    func updateHighScore() {
        if (currentScore > highScore) {
            highScore = currentScore
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gemSlots = [gemSlot0, gemSlot1, gemSlot2, gemSlot3, gemSlot4, gemSlot5, gemSlot6, gemSlot7, gemSlot8,
                    gemSlot9, gemSlot10, gemSlot11, gemSlot12, gemSlot13, gemSlot14, gemSlot15]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

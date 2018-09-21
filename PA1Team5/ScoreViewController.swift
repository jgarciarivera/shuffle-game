//  ScoreViewController.swift
//  PA1Team5
//
//  Created by Ubicomp Team 5 on 9/20/18.
//  Copyright © 2018 cpl.ubicomp. All rights reserved.

import UIKit

class ScoreViewController: UIViewController {
    
    var currentScore: Int?
    var mostFrequentColor: String?
    
    @IBOutlet weak var mostFrequentColorLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!

    @IBAction func buttonDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        currentScoreLabel.text = String(currentScore!)
        mostFrequentColorLabel.text = mostFrequentColor
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

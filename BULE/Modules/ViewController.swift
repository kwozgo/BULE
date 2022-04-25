//
//  ViewController.swift
//  BULE
//
//  Created by Charlie Walton on 4/21/22.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var targetLabel: UILabel!
    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var roundLabel: UILabel!
    
    private var currentValue: Int = 0
    private var targetValue: Int = 0
    private var score: Int = 0
    private var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startRound()
    }
    
    @IBAction private func hitMePressed() {
        let difference: Int = abs(self.currentValue - self.targetValue)
        let points = 100 - difference
        self.score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Petty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "Okay",
            style: .default
        )
        alert.addAction(action)
        self.present(alert, animated: true)
        self.startRound()
    }
    
    @IBAction private func sliderMoved(_ slider: UISlider) {
        self.currentValue = lroundf(slider.value)
    }
    
    private func startRound() {
        self.round += 1
        self.targetValue = .random(in: 1...100)
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.updateLabels()
    }
    
    private func updateLabels() {
        self.targetLabel.text = String(self.targetValue)
        self.scoreLabel.text = String(self.score)
        self.roundLabel.text = String(self.round)
    }
}

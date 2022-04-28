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
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        self.slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        self.slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        self.slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        self.slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        self.startRound()
    }
    
    @IBAction private func hitMePressed() {
        let difference: Int = abs(self.currentValue - self.targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Petty good!"
        } else {
            title = "Not even close..."
        }
        
        self.score += points
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "Okay",
            style: .default
        ) { [weak self] _ in
            self?.startRound()
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    @IBAction private func sliderMoved(_ slider: UISlider) {
        self.currentValue = lroundf(slider.value)
    }
    
    @IBAction private func startOverPressed() {
        self.round = .zero
        self.score = .zero
        self.startRound()
    }
    
    private func startRound() {
        self.round += 1
        self.targetValue = .random(in: 1...100)
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.updateLabels()
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        self.view.layer.add(transition, forKey: nil)
    }
    
    private func updateLabels() {
        self.targetLabel.text = String(self.targetValue)
        self.scoreLabel.text = String(self.score)
        self.roundLabel.text = String(self.round)
    }
}

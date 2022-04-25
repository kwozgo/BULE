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
    
    private var currentValue: Int = 0
    private var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startRound()
    }
    
    @IBAction private func hitMePressed() {
        let difference: Int = abs(self.currentValue - self.targetValue)
        
        let message = "The value of the slider is \(self.currentValue)"
                        + "\nThe target value is \(self.targetValue)"
                        + "\nThe difference is \(difference)"
        let alert = UIAlertController(
            title: "Hello, World",
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
        self.targetValue = .random(in: 1...100)
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.updateLabels()
    }
    
    private func updateLabels() {
        self.targetLabel.text = String(self.targetValue)
    }
}

//
//  ViewController.swift
//  BULE
//
//  Created by Charlie Walton on 4/21/22.
//

import UIKit

final class ViewController: UIViewController {
    
    var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func hitMePressed() {
        let message = "The value of the slider is \(self.currentValue)"
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
        present(alert, animated: true)
    }
    
    @IBAction private func sliderMoved(_ slider: UISlider) {
        self.currentValue = lroundf(slider.value)
    }
}

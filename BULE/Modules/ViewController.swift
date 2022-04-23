//
//  ViewController.swift
//  BULE
//
//  Created by Charlie Walton on 4/21/22.
//

import UIKit

final class ViewController: UIViewController {
    
    var currentValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func hitMePressed() {
        let alert = UIAlertController(
            title: "Hello, World",
            message: "This is my first app!",
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "Awesome",
            style: .default
        )
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction private func sliderMoved(_ slider: UISlider) {
        self.currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(slider.value)")
    }
}

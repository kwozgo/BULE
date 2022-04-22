//
//  ViewController.swift
//  BULE
//
//  Created by Charlie Walton on 4/21/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hitMePressed() {
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
}

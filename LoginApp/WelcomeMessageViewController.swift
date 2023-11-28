//
//  WelcomeMessageViewController.swift
//  LoginApp
//
//  Created by Ксения Загарьева on 28.11.2023.
//

import UIKit

final class WelcomeMessageViewController: UIViewController {
    @IBOutlet var welcomeMessage: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // welcomeMessage.text = "Welcome, \(userName.loginTextField.text)"
    }
    
    @IBAction func logOutButtonAction() {
        dismiss(animated: true)
    }
}

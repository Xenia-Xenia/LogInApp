//
//  WelcomeMessageViewController.swift
//  LoginApp
//
//  Created by Ксения Загарьева on 28.11.2023.
//

import UIKit

final class WelcomeMessageViewController: UIViewController {
    
    @IBOutlet var welcomeMessage: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = "Welcome, \(String(userName))"
    }
}

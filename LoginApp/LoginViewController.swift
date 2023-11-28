//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Ксения Загарьева on 27.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    // MARK: - Public Properties
    var login: String!
    var password: String!
    
    // MARK: - Private Properties
    private let correctLogin = "Ivanushka"
    private let correctPassword = "BabyGoat"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 5
        loginTextField.text = login
        passwordTextField.text = password
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard 
            loginTextField.text == correctLogin,
            passwordTextField.text == correctPassword 
        else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
            return false
        }
      //  let logInButtonVC = segue.destination as? WelcomeMessageViewController
        return true
    }
    
    // MARK: - IB Actions
    @IBAction func forgotUserNameButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your login is Ivanushka 🫣"
        )
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is BabyGoat 🤫"
        )
    }

    // MARK: - Private Methods
    private func showAlert(
        withTitle title: String,
        andMessage message: String
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            self.loginTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


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
    
    // MARK: - Private Properties
    private let login = "Ivanushka"
    private let password = "BabyGoat"
    
    // MARK: - View Life Cycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeMessageVC = segue.destination as? WelcomeViewController else {return}
        welcomeMessageVC.userName = login
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard
            loginTextField.text == login,
            passwordTextField.text == password
        else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    // MARK: - IB Actions
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your login is \(login) 🫣")
        : showAlert(title: "Oops!", message: "Your password is \(password) 🤫")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }

    // MARK: - Private Methods
    private func showAlert(
        title: String,
        message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


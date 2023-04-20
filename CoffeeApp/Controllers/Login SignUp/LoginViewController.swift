//
//  LoginViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class LoginViewController: UIViewController {
        
    // MARK: - Outlets
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldUnderscore: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextFieldUnderscore: UIView!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGestures()
    }
    
    
    // MARK: - Actions
    @IBAction func didTappedLoginButton(_ sender: UIButton){
        checkFieldsBeforeSignIn()
    }
    
    @IBAction func didTappedForgotPasswordButton(_ sender: UIButton){
        PresenterManager.shared.navigate(to: .resetPasswordPage)
    }


    // MARK: - Methods
    private func setupView(){
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        emailTextField.delegate = self
        passwordTextField.delegate = self
        overrideUserInterfaceStyle = .light
    }
    
    
    private func checkFieldsBeforeSignIn(){
        if emailTextField.text == "" || passwordTextField.text == "" {
            emailTextFieldUnderscore.shake()
            passwordTextFieldUnderscore.shake()
            errorMessage.isHidden = false
            errorMessage.text = "Looks like you missed something."
        } else {
            signIn()
        }
    }
    
    
    private func signIn(){
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.errorMessage.isHidden = false
                self.errorMessage.text = "\(error.localizedDescription)"
                self.emailTextFieldUnderscore.shake()
                self.passwordTextFieldUnderscore.shake()
                return
            }
            
            guard let user = authResult?.user else { return }
            
            if user.isEmailVerified {
                UserDefaults.standard.set(true, forKey: "userIsLoggedIn")
                PresenterManager.shared.navigate(to: .mainTabBarController)
            } else {
                self.emailTextFieldUnderscore.shake()
                self.passwordTextFieldUnderscore.shake()
                self.errorMessage.isHidden = false
                self.errorMessage.text = "Incorrect password or email address."
            }
        }
    }
    

}



// MARK: - TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.frame.origin.y = view.frame.origin.y - 200
        loginLabel.isHidden = true
        welcomeLabel.isHidden = true
         
        switch textField {
        case self.emailTextField:
            emailTextFieldUnderscore.getCustromUnderscore(width: emailTextField)
        case self.passwordTextField:
            passwordTextFieldUnderscore.getCustromUnderscore(width: passwordTextField)
        default:
            return
        }
    }
       
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.frame.origin.y = view.frame.origin.y + 200
        loginLabel.isHidden = false
        welcomeLabel.isHidden = false
        
        switch textField {
        case self.emailTextField:
            emailTextFieldUnderscore.getDefaultUnderscore(width: emailTextField)
        case self.passwordTextField:
            passwordTextFieldUnderscore.getDefaultUnderscore(width: passwordTextField)
        default:
            return
        }
    }
}

// MARK: - Gesture to dismiss keyboard
extension LoginViewController: UIGestureRecognizerDelegate {
    func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
  
}



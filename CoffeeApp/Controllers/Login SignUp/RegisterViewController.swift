//
//  RegisterViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class RegisterViewController: UIViewController {
        
    // MARK: - Outlets
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameTextFieldUnderscore: UIView!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var lastnameTextFieldUnderscore: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldUnderscore: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextFieldUnderscore: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextFieldUnderscore: UIView!

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGestures()
    }
    
    // MARK: - Actions
    @IBAction func didTappedRegisterButton(_ sender: UIButton){
        checkFieldsBeforeSignUp()
    }
    
    // MARK: - Methods
    private func setupView(){
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
        nameTextField.delegate = self
        lastnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        overrideUserInterfaceStyle = .light
    }
 
    
    private func checkFieldsBeforeSignUp(){
        errorMessageLabel.isHidden = false

        if Validators.isFilled(name: nameTextField, lastname: lastnameTextField, email: emailTextField, password: passwordTextField, confirmPassword: confirmPasswordTextField) == false {
            errorMessageLabel.text = "Looks like you missed something.\nPlease fill in all required fields with valid information."
        }
        else if Validators.isConfirmed(password: passwordTextField, confirmation: confirmPasswordTextField) == false {
            errorMessageLabel.text = "The password confirmation does not match."
        }
        else if Validators.isValidPassword(password: passwordTextField) == false {
            errorMessageLabel.text = "Password is too short (minimum is 6 characters)."
        }
        else if Validators.isValidEmail(email: emailTextField) == false {
            errorMessageLabel.text = "Incorrect email address."
        }
        else {
            errorMessageLabel.isHidden = true
            createUser()
        }
    }
    
    
    private func createUser(){
        let name = nameTextField.text!
        let lastname = lastnameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
      
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                let db = Firestore.firestore()
                db.collection("user").addDocument(data: ["firstName" : name,
                                                         "lastName" : lastname,
                                                         "email" : email,
                                                         "uid" : authResult!.user.uid])
              
                // User created successfully. Send email verification.
                authResult?.user.sendEmailVerification(completion: { (error) in
                    if let error = error {
                        print("Error sending verification email: \(error.localizedDescription)")
                        return
                    }
                    print("Verification email sent.")
                })
                PresenterManager.shared.navigate(to: .emailConfirmPage)
            } else {
                self.errorMessageLabel.isHidden = false
                self.errorMessageLabel.text = "\(String(describing: error!.localizedDescription))"
            }
        }
    }
}


// MARK: - TextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.frame.origin.y = view.frame.origin.y - 230
        registerLabel.isHidden = true
        welcomeLabel.isHidden = true
        
        switch textField {
        case self.nameTextField:
            nameTextFieldUnderscore.getCustromUnderscore(width: nameTextField)
        case self.lastnameTextField:
            lastnameTextFieldUnderscore.getCustromUnderscore(width: lastnameTextField)
        case self.emailTextField:
            emailTextFieldUnderscore.getCustromUnderscore(width: emailTextField)
        case self.passwordTextField:
            passwordTextFieldUnderscore.getCustromUnderscore(width: passwordTextField)
        case self.confirmPasswordTextField:
            confirmPasswordTextFieldUnderscore.getCustromUnderscore(width: confirmPasswordTextField)
        default:
            return
        }
    }
       
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.frame.origin.y = view.frame.origin.y + 230
        registerLabel.isHidden = false
        welcomeLabel.isHidden = false

        switch textField {
        case self.nameTextField:
            nameTextFieldUnderscore.getDefaultUnderscore(width: nameTextField)
        case self.lastnameTextField:
            lastnameTextFieldUnderscore.getDefaultUnderscore(width: lastnameTextField)
        case self.emailTextField:
            emailTextFieldUnderscore.getDefaultUnderscore(width: emailTextField)
        case self.passwordTextField:
            passwordTextFieldUnderscore.getDefaultUnderscore(width: passwordTextField)
        case self.confirmPasswordTextField:
            confirmPasswordTextFieldUnderscore.getDefaultUnderscore(width: confirmPasswordTextField)
        default:
            return
        }
    }
    
}


// MARK: - Gesture to dismiss keyboard
extension RegisterViewController: UIGestureRecognizerDelegate {
    func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
  
}

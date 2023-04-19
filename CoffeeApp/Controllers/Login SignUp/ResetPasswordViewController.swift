//
//  ResetPasswordViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 15.04.23.
//

import UIKit
import Lottie
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldUnderscore: UIView!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var goToLoginPageButton: UIButton!
    @IBOutlet weak var animationView: LottieAnimationView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGestures()
        animation()
        overrideUserInterfaceStyle = .light
    }
    
    // MARK: - Actions
    @IBAction func didTappedResetPasswordButton(_ sender: UIButton){
        checkFieldsBeforeResetting()
    }
    
    @IBAction func didTappedGotoLoginPageButton(_ sender: UIButton){
        PresenterManager.shared.navigate(to: .onboarding)
    }
    
    // MARK: - Methods
    private func setupView(){
        resetPasswordButton.layer.cornerRadius = resetPasswordButton.frame.height / 2
        goToLoginPageButton.layer.cornerRadius = goToLoginPageButton.frame.height / 2
        emailTextField.delegate = self
    }
    
    private func animation(){
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .playOnce
        animationView.play()
    }
    
    private func checkFieldsBeforeResetting(){
        if emailTextField.text == "" {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = "Please enter email address."
        } else {
            resetPassword()
        }
    }
    
    private func resetPassword(){
        let email = emailTextField.text!
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.errorMessageLabel.isHidden = false
                self.errorMessageLabel.text = "\(error.localizedDescription)"
            } else {
                self.titleLabel.text = "Please check your email"
                self.emailTextField.text = ""
            }
        }
    }
}

// MARK: - TextFieldDelegate
extension ResetPasswordViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.frame.origin.y = view.frame.origin.y - 200
        emailTextFieldUnderscore.getCustromUnderscore(width: emailTextField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.frame.origin.y = view.frame.origin.y + 200
        emailTextFieldUnderscore.getDefaultUnderscore(width: emailTextField)
    }
}

// MARK: - Gesture to dismiss keyboard
extension ResetPasswordViewController: UIGestureRecognizerDelegate {
    func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(){
        emailTextField.resignFirstResponder()
        view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        switch touch.view {
        case self.view:
            return touch.view == self.view
        case self.animationView:
            return touch.view == self.animationView
        case self.titleLabel:
            return touch.view == self.titleLabel
        case .none:
            return true
        case .some(_):
            return true
        }
    }
  
}

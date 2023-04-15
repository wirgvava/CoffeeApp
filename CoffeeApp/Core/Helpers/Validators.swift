//
//  Validators.swift
//  CoffeeApp
//
//  Created by konstantine on 15.04.23.
//

import UIKit

class Validators {
    
    static func isFilled(name: UITextField, lastname: UITextField, email: UITextField, password: UITextField, confirmPassword: UITextField) -> Bool {
        if name.text == "" || lastname.text == "" || email.text == "" || password.text == "" || confirmPassword.text == "" {
            return false
        } else {
            return true
        }
    }


    static func isConfirmed(password: UITextField, confirmation: UITextField) -> Bool{
        if password.text == confirmation.text {
            return true
        } else {
            return false
        }
    }


    static func isValidPassword(password: UITextField) -> Bool {
        if password.text?.count == 6 {
            return true
        } else {
            return false
        }
    }
    
    
    static func isValidEmail(email: UITextField) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email.text)
    }
}


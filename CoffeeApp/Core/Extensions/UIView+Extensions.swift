//
//  UIView+Extensions.swift
//  CoffeeApp
//
//  Created by konstantine on 14.04.23.
//

import UIKit

extension UIView {
    func getCustromUnderscore(width textField: UITextField){
        self.backgroundColor = UIColor(red: 186/255, green: 128/255, blue: 104/255, alpha: 1)
        self.layer.frame.size = CGSize(width: textField.frame.width, height: 2)
    }
    
    func getDefaultUnderscore(width textField: UITextField){
        self.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 238/255, alpha: 1)
        self.layer.frame.size = CGSize(width: textField.frame.width, height: 1)
    }
}

//
//  UIView+Extensions.swift
//  CoffeeApp
//
//  Created by konstantine on 14.04.23.
//

import UIKit
import AudioToolbox

extension UIView {
    func getCustromUnderscore(width textField: UITextField){
        self.backgroundColor = UIColor(red: 186/255, green: 128/255, blue: 104/255, alpha: 1)
        self.layer.frame.size = CGSize(width: textField.frame.width, height: 2)
    }
    
    func getDefaultUnderscore(width textField: UITextField){
        self.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 238/255, alpha: 1)
        self.layer.frame.size = CGSize(width: textField.frame.width, height: 1)
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        layer.add(shake, forKey: "position")
        
        // Play the vibration sound
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}

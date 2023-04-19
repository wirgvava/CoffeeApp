//
//  SwitchButtons.swift
//  CoffeeApp
//
//  Created by konstantine on 18.04.23.
//

import UIKit

class SwitchButtons{
    
    enum SelectedButtons {
        case hotCoffee
        case frappucino
        case hotTea
        
        var image: UIImage {
            switch self {
            case .hotCoffee: return UIImage(named: "Hot Coffee Button Tapped")!
            case .frappucino: return UIImage(named: "Frappucino Button Selected")!
            case .hotTea: return UIImage(named: "Hot Tea Button Tapped")!
            }
        }
    }
        
    enum unSelectedButtons {
        case hotCoffee
        case frappucino
        case hotTea
        
        var image: UIImage {
            switch self {
            case .hotCoffee: return UIImage(named: "hot coffee button")!
            case .frappucino: return UIImage(named: "frappucino button")!
            case .hotTea: return UIImage(named: "hot tea button")!
            }
        }
    }
    
    static func customizeButtons(primary: UIButton, primaryImage: UIImage, secondaryOne: UIButton, secondaryOneImage: UIImage, secondaryTwo: UIButton, secondaryTwoImage: UIImage){
        primary.tintColor = UIColor(red: 156/255, green: 108/255, blue: 77/255, alpha: 1)
        secondaryOne.tintColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        secondaryTwo.tintColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        primary.setImage(primaryImage, for: .normal)
        secondaryOne.setImage(secondaryOneImage, for: .normal)
        secondaryTwo.setImage(secondaryTwoImage, for: .normal)
    }
}

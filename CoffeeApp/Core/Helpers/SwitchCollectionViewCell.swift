//
//  SwitchCollectionViewCell.swift
//  CoffeeApp
//
//  Created by konstantine on 18.04.23.
//

import UIKit

class SwitchCollectionViewCell {
    
    enum Cell {
        case hotCoffee
        case frappuccino
        case hotTea
        
        var cell: [(image: UIImage?, name: String, price: String)] {
            switch self {
            case .hotCoffee:
                return DataManager.shared.hotCoffees
            case .frappuccino:
                return DataManager.shared.frappuccinos
            case .hotTea:
                return DataManager.shared.hotTeas
            }
        }
    }
      
}

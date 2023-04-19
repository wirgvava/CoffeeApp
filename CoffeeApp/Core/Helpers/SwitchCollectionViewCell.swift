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
        
        var cell: [(image: UIImage?, name: String)] {
            switch self {
            case .hotCoffee:
                return DataManager.shared.mainHotCoffees
            case .frappuccino:
                return DataManager.shared.mainFrappuccinos
            case .hotTea:
                return DataManager.shared.mainHotTeas
            }
        }
    }
      
}

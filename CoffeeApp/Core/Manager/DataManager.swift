//
//  DataManager.swift
//  CoffeeApp
//
//  Created by konstantine on 18.04.23.
//

import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    var sideMenuDrinks = [(image: UIImage(named: "CheescakeFrappuccino with BG"), name: "Cheescake \nFrappuccino"),
                          (image: UIImage(named: "StrawberryLatte with BG"), name: "Strawberry \nLatte"),
                          (image: UIImage(named: "CaramelFrappucino with BG"), name: "Caramel \nFrappuccino"),
                          (image: UIImage(named: "CheescakeFrappuccino with BG"), name: "Cheescake \nFrappuccino"),
                          (image: UIImage(named: "StrawberryLatte with BG"), name: "Strawberry \nLatte"),
                          (image: UIImage(named: "CaramelFrappucino with BG"), name: "Caramel \nFrappuccino")]
    
    var mainFrappuccinos = [(image: UIImage(named: "Caramel Frappuccino"), name: "Caramel \nFrappuccino"),
                            (image: UIImage(named: "Cheescake Frappuccino"), name: "Cheescake \nFrappuccino"),
                            (image: UIImage(named: "Strawberry Latte"), name: "Strawberry \nLatte"),
                            (image: UIImage(named: "Caramel Frappuccino"), name: "Caramel \nFrappuccino"),
                            (image: UIImage(named: "Cheescake Frappuccino"), name: "Cheescake \nFrappuccino"),
                            (image: UIImage(named: "Strawberry Latte"), name: "Strawberry \nLatte")]
    
    var mainHotCoffees = [(image: UIImage(named: "coffee"), name: "Hot Coffee"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee")]
    
    var mainHotTeas = [(image: UIImage(named: "tea"), name: "Hot Tea"),
                       (image: UIImage(named: "tea"), name: "Hot Tea"),
                       (image: UIImage(named: "tea"), name: "Hot Tea"),
                       (image: UIImage(named: "tea"), name: "Hot Tea"),
                       (image: UIImage(named: "tea"), name: "Hot Tea"),
                       (image: UIImage(named: "tea"), name: "Hot Tea")]

    
}

//
//  DataManager.swift
//  CoffeeApp
//
//  Created by konstantine on 18.04.23.
//

import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    var sideMenuDrinks = [(image: UIImage(named: "CheescakeFrappuccino with BG"), name: "Cheescake \nFrappuccino", price: "$ 18.70"),
                          (image: UIImage(named: "StrawberryLatte with BG"), name: "Strawberry \nLatte", price: "$ 18.70"),
                          (image: UIImage(named: "CaramelFrappucino with BG"), name: "Caramel \nFrappuccino", price: "$ 18.70"),
                          (image: UIImage(named: "CheescakeFrappuccino with BG"), name: "Cheescake \nFrappuccino", price: "$ 18.70"),
                          (image: UIImage(named: "StrawberryLatte with BG"), name: "Strawberry \nLatte", price: "$ 18.70"),
                          (image: UIImage(named: "CaramelFrappucino with BG"), name: "Caramel \nFrappuccino", price: "$ 18.70")]
    
    var frappuccinos = [(image: UIImage(named: "Caramel Frappuccino"), name: "Caramel \nFrappuccino", price: "$ 18.70"),
                            (image: UIImage(named: "Cheescake Frappuccino"), name: "Cheescake \nFrappuccino", price: "$ 18.70"),
                            (image: UIImage(named: "Strawberry Latte"), name: "Strawberry \nLatte", price: "$ 18.70"),
                            (image: UIImage(named: "Caramel Frappuccino"), name: "Caramel \nFrappuccino", price: "$ 18.70"),
                            (image: UIImage(named: "Cheescake Frappuccino"), name: "Cheescake \nFrappuccino", price: "$ 18.70"),
                            (image: UIImage(named: "Strawberry Latte"), name: "Strawberry \nLatte", price: "$ 18.70")]
    
    var hotCoffees = [(image: UIImage(named: "coffee"), name: "Hot Coffee", price: "$ 5.60"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee", price: "$ 5.60"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee", price: "$ 5.60"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee", price: "$ 5.60"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee", price: "$ 5.60"),
                          (image: UIImage(named: "coffee"), name: "Hot Coffee", price: "$ 5.60")]
    
    var hotTeas = [(image: UIImage(named: "tea"), name: "Hot Tea", price: "$ 4.40"),
                       (image: UIImage(named: "tea"), name: "Hot Tea", price: "$ 4.40"),
                       (image: UIImage(named: "tea"), name: "Hot Tea", price: "$ 4.40"),
                       (image: UIImage(named: "tea"), name: "Hot Tea", price: "$ 4.40"),
                       (image: UIImage(named: "tea"), name: "Hot Tea", price: "$ 4.40"),
                       (image: UIImage(named: "tea"), name: "Hot Tea", price: "$ 4.40")]

    
}

//
//  OrderViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 19.04.23.
//

import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nav()
        view.backgroundColor = .lightGray
    }
    
    func nav(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "sheetViewController") as! SheetViewController
        self.present(sheetPresentationController, animated: true, completion: nil)
    }


}

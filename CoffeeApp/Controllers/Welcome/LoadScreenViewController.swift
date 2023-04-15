//
//  LoadScreenViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit

class LoadScreenViewController: UIViewController {
    
    // MARK: - Variables & Constants
    var isUserLoggedIn = UserDefaults.standard.bool(forKey: "userIsLoggedIn")
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.showInitialView()
        }
    }
   
    
    // MARK: - Methods
    private func showInitialView(){
        if isUserLoggedIn {
            PresenterManager.shared.navigate(to: .mainTabBarController)
        } else {
            performSegue(withIdentifier: "showOnboarding", sender: nil)
        }
    }
    
}

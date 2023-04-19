//
//  PresenterManager.swift
//  CoffeeApp
//
//  Created by konstantine on 13.04.23.
//
import UIKit

class PresenterManager {
    
    static let shared = PresenterManager()
    
    private init() {}
   
    enum VC {
        case mainTabBarController
        case onboarding
        case emailConfirmPage
        case resetPasswordPage
        case orderPage
    }

    func navigate(to vc: VC){
        var viewController: UIViewController
        
        switch vc {
        case .mainTabBarController:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabBarController")
        case .onboarding:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingViewController")
        case .emailConfirmPage:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "confirmationPageViewController")
        case .resetPasswordPage:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resetPasswordViewController")
        case .orderPage:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "orderViewController")
        }
       
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil)
        }
        
    }
    
}

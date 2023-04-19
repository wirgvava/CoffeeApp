//
//  ConfirmationPageViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 15.04.23.
//

import UIKit
import Lottie

class ConfirmationPageViewController: UIViewController {
     
    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var animationView: LottieAnimationView!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        overrideUserInterfaceStyle = .light
    }
    
    // MARK: - Actions
    @IBAction func didTappedLoginButton(_ sender: UIButton){
        PresenterManager.shared.navigate(to: .onboarding)
    }
    
    // MARK: - Methods
    private func setupAnimation(){
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play()
    }
    
    
}

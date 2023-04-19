//
//  SheetViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 19.04.23.
//

import UIKit

class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {

    override var sheetPresentationController: UISheetPresentationController?{
        presentationController as? UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blur = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blur)
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.4)
        blurView.frame = view.bounds
        view.addSubview(blurView)
        view.sendSubviewToBack(blurView)
        sheetPresentationController?.delegate = self
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.detents = [.medium(), .large()]
        sheetPresentationController?.preferredCornerRadius = 22
    }
}

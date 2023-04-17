//
//  UIViewController+Extension.swift
//  CoffeeApp
//
//  Created by konstantine on 16.04.23.
//

import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}

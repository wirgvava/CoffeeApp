//
//  OrderSheetViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 19.04.23.
//

import UIKit

class OrderSheetViewController: UIViewController, UISheetPresentationControllerDelegate {

    override var sheetPresentationController: UISheetPresentationController?{
        presentationController as? UISheetPresentationController
    }
    
    var data: (image: UIImage?, name: String, price: String)!
    var orderResponse: [String : Any] = [:]
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = data.name
        let image = data.image!
        orderResponse = ["OrderInfo" : ["name" : name, "image" : image] as [String : Any]]

        
        setupSheet()
    }
    
    // MARK: - Actions
    @IBAction func didTappedAddToCartButton(_ sender: UIButton){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "added to cart"), object: nil, userInfo: orderResponse)
        self.dismiss(animated: true)
    }
    
    // MARK: - Methods
    private func setupSheet(){
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        sheetPresentationController?.delegate = self
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.preferredCornerRadius = 22
        if #available(iOS 16.0, *) {
            sheetPresentationController?.detents = [.custom(resolver: { context in
                0.4 * context.maximumDetentValue
            })]
        } else {
            //
        }
        
        addToCartButton.layer.cornerRadius = addToCartButton.frame.height / 2
        addToCartButton.layer.borderWidth = 1
        addToCartButton.layer.borderColor = CGColor(red: 156/255, green: 108/255, blue: 77/255, alpha: 1)
        nameLabel.text = data.name
        priceLabel.text = "Price: \(data.price)"
    }
    
    
    func set(data: (image: UIImage?, name: String, price: String)){
        self.data = data
    }
    
    
}

//
//  HomeViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit
import SnapKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class HomeViewController: UIViewController {
    
    var drinks = [(image: UIImage(named: "Cheescake Frappuccino"), name: "Cheescake \nFrappuccino"),
                  (image: UIImage(named: "Strawberry Latte"), name: "Strawberry \nLatte"),
                  (image: UIImage(named: "Caramel Frappuccino"), name: "Caramel \nFrappuccino")]
    
    // MARK: - Outlets
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var handleSideMenu: UIImageView!
    @IBOutlet weak var dragOutButton: UIButton!
    @IBOutlet weak var dragInButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupView()
        setupGestures()
        sideMenuTableView.dataSource = self
        sideMenuTableView.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func didTappedDragOutButton(_ sender: UIButton) {
        dragOutSideMenu()
    }
    
    @IBAction func didTappedDragInButton(_ sender: UIButton) {
        dragInSideMenu()
    }

    // MARK: - Methods
    private func setupView(){
        sideMenuView.snp.remakeConstraints { make in
            make.leading.equalTo(-190)
        }
        dragInButton.setTitle("", for: .normal)
        dragOutButton.setTitle("", for: .normal)
        dragInButton.isHidden = true
    }
    
    
    private func dragOutSideMenu(){
        sideMenuView.snp.remakeConstraints { make in
            make.leading.equalTo(0)
        }
        uiAnimation()
        shadowWhenDragedOut(isTurnedOn: true)
        dragOutButton.isHidden = true
        dragInButton.isHidden = false
        tabBarController?.tabBar.isHidden = true

    }
    
    private func dragInSideMenu(){
        sideMenuView.snp.remakeConstraints { make in
            make.leading.equalTo(-190)
        }
        uiAnimation()
        shadowWhenDragedOut(isTurnedOn: false)
        dragInButton.isHidden = true
        dragOutButton.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }
    
    private func uiAnimation(){
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func shadowWhenDragedOut(isTurnedOn: Bool){
        if isTurnedOn == true {
            handleSideMenu.layer.shadowColor = UIColor.brown.cgColor
            handleSideMenu.layer.shadowOffset = CGSize(width: 5, height: 0)
            handleSideMenu.layer.shadowOpacity = 1
            handleSideMenu.layer.shadowRadius = 20
        } else if isTurnedOn == false {
            handleSideMenu.layer.shadowColor = UIColor.brown.cgColor
            handleSideMenu.layer.shadowOffset = CGSize(width: 0, height: 0)
            handleSideMenu.layer.shadowOpacity = 0
            handleSideMenu.layer.shadowRadius = 0
        }
    }
    
}

// MARK: - CollectionView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "sideMenuTableView", for: indexPath) as! SideMenuTableViewCell
        let drink = drinks[indexPath.row]
        sideMenuTableView.backgroundColor = .clear
        cell.drinkImage.image = drink.image
        cell.drinkName.text = drink.name
        return cell
    }
}



// MARK: - Gesture
extension HomeViewController: UIGestureRecognizerDelegate {
    func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSideMenu))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissSideMenu(){
        dragInSideMenu()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
  
}

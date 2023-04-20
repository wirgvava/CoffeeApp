//
//  SideMenuViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 16.04.23.
//

import UIKit

class SideMenuViewController: UIViewController {
     
    // MARK: - Constants
    let background = UIView()
    let handler = UIImageView()
    let dragOutButton = UIButton(type: .system)
    let dragInButton = UIButton(type: .system)
    let titleLabel = UILabel()
    let tableView = UITableView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setHandeler()
        setDragOutButton()
        setupGestures()
        dragOutButton.addTarget(self, action: #selector(didTappedDragOutMenu(_:)), for: .touchDragOutside)
        dragInButton.addTarget(self, action: #selector(didTappedDragInMenu(_:)), for: .touchDragInside)
        overrideUserInterfaceStyle = .light
    }
    
    // MARK: - Actions
    @objc func didTappedDragOutMenu(_ sender: UIButton){
        dragOutMenu()
    }

    @objc private func didTappedDragInMenu(_ sender: UIButton){
        dragInMenu()
    }
    
    
    // MARK: - Methods
    private func setSideMenu(){
        self.view.addSubview(background)
        background.backgroundColor = UIColor(red: 156/255, green: 108/255, blue: 77/255, alpha: 1)
        background.frame = CGRect(x: -190, y: 0, width: 190, height: self.view.frame.height)
    }
    
    private func setHandeler(){
        self.view.addSubview(handler)
        handler.contentMode = .bottomLeft
        handler.image = UIImage(named: "sideMenu")
        handler.frame = CGRect(x: -10, y: 0, width: 200, height: self.view.frame.height)
    }

    //  Buttons ---------------------------------------------------------------------------------------
    private func setDragOutButton(){
        self.view.addSubview(dragOutButton)
        dragOutButton.setImage(.init(systemName: "chevron.right"), for: .normal)
        dragOutButton.tintColor = .white
        dragOutButton.frame = CGRect(x: 2, y: (self.view.frame.height) - 233, width: 50, height: 65)
    }
    
    private func setDragInButton(){
        self.view.addSubview(dragInButton)
        dragInButton.setImage(.init(systemName: "chevron.left"), for: .normal)
        dragInButton.tintColor = .white
        dragInButton.frame = CGRect(x: 2, y: (self.view.frame.height) - 233, width: 50, height: 65)
    }
    //  ------------------------------------------------------------------------------------------------

    private func dragOutMenu(){
        setSideMenu()
        setTitle()
        setTableView()
        self.tableView.reloadData()
        background.frame = CGRect(x: 0, y: 0, width: 190, height: self.view.frame.height)
        handler.frame = CGRect(x: 180, y: 0, width: 200, height: self.view.frame.height)
        setDragInButton()
        dragOutButton.frame = CGRect(x: 188, y: (self.view.frame.height) - 233, width: 50, height: 65)
        dragInButton.frame = CGRect(x: 188, y: (self.view.frame.height) - 233, width: 50, height: 65)
        dragOutButton.isHidden = true
        dragInButton.isHidden = false
        shadowWhenDragedOut(isTurnedOn: true)
        tabBarController?.tabBar.isHidden = true
    }
    
    private func dragInMenu(){
        background.frame = CGRect(x: -190, y: 0, width: 190, height: self.view.frame.height)
        handler.frame = CGRect(x: -10, y: 0, width: 200, height: self.view.frame.height)
        dragOutButton.frame = CGRect(x: 2, y: (self.view.frame.height) - 233, width: 50, height: 65)
        dragInButton.frame = CGRect(x: 2, y: (self.view.frame.height) - 233, width: 50, height: 65)
        dragInButton.isHidden = true
        dragOutButton.isHidden = false
        shadowWhenDragedOut(isTurnedOn: false)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    //  Title
    private func setTitle(){
        titleLabel.text = "Previous \nOrders"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        self.background.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 20, y: 65, width: (self.background.frame.width) - 20, height: 80)
    }
    
    //  Side Menu Shadow
    private func shadowWhenDragedOut(isTurnedOn: Bool){
        if isTurnedOn == true {
            handler.layer.shadowColor = UIColor.brown.cgColor
            handler.layer.shadowOffset = CGSize(width: 5, height: 0)
            handler.layer.shadowOpacity = 1
            handler.layer.shadowRadius = 20
        } else if isTurnedOn == false {
            handler.layer.shadowColor = UIColor.brown.cgColor
            handler.layer.shadowOffset = CGSize(width: 0, height: 0)
            handler.layer.shadowOpacity = 0
            handler.layer.shadowRadius = 0
        }
    }
    
    // TableView
    private func setTableView(){
        tableView.rowHeight = 252
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: "sideMenuCell")
        self.background.addSubview(tableView)
        tableView.frame = CGRect(x: 10, y: 160, width: (self.background.frame.width) - 20, height: (self.background.frame.height) - 160)
    }
}

// MARK: - TableView
extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.sideMenuDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! SideMenuTableViewCell
        let contentView = cell.contentView
        let drinks = DataManager.shared.sideMenuDrinks[indexPath.row]
        cell.frame.size = CGSize(width: tableView.frame.width, height: 252)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        DispatchQueue.main.async {
//            cell.setBackgroundForCell(contentView: contentView)
            cell.setNameOfDrink(contentView: contentView)
            cell.setImageOfDrink(contentView: contentView)
        }
        cell.imageOfDrink.image = drinks.image
        cell.nameOfDrink.text = drinks.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sheet = storyboard.instantiateViewController(withIdentifier: "orderSheetViewController") as! OrderSheetViewController
        let data = DataManager.shared.sideMenuDrinks[indexPath.item]
        sheet.set(data: (image: data.image, name: data.name, price: data.price))
        dragInMenu()
        present(sheet, animated: true, completion: nil)
    }
}

//MARK: - Gesture to dismiss menu
extension SideMenuViewController: UIGestureRecognizerDelegate {
    func setupGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSideMenu(_:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissSideMenu(_ sender: UIButton){
        dragInMenu()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}

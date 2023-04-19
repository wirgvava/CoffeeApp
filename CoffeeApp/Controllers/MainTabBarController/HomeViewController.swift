//
//  HomeViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit
import CollectionViewPagingLayout

class HomeViewController: SideMenuViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var hotCoffeeButton: UIButton!
    @IBOutlet weak var frappucinoButton: UIButton!
    @IBOutlet weak var hotTeaButton: UIButton!
    
    // MARK: - Variables & Constants
    let selectedButtons = SwitchButtons.SelectedButtons.self
    let unSelectedButtons = SwitchButtons.unSelectedButtons.self
    var collectionView: UICollectionView!
    var data = DataManager.shared.mainFrappuccinos
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        self.view.sendSubviewToBack(collectionView)
        overrideUserInterfaceStyle = .light
    }
    
    
    // MARK: - Actions
    @IBAction func didTappedHotCoffeeBtn(_ sender: UIButton){
        SwitchButtons.customizeButtons(primary: hotCoffeeButton, primaryImage: selectedButtons.hotCoffee.image, secondaryOne: frappucinoButton, secondaryOneImage: unSelectedButtons.frappucino.image, secondaryTwo: hotTeaButton, secondaryTwoImage: unSelectedButtons.hotTea.image)
        reloadData(newData: SwitchCollectionViewCell.Cell.hotCoffee.cell)
    }
    
    @IBAction func didTappedFrappucinoBtn(_ sender: UIButton){
        SwitchButtons.customizeButtons(primary: frappucinoButton, primaryImage: selectedButtons.frappucino.image, secondaryOne: hotTeaButton, secondaryOneImage: unSelectedButtons.hotTea.image, secondaryTwo: hotCoffeeButton, secondaryTwoImage: unSelectedButtons.hotCoffee.image)
        reloadData(newData: SwitchCollectionViewCell.Cell.frappuccino.cell)
    }
    
    @IBAction func didTappedHotTeaBtn(_ sender: UIButton){
        SwitchButtons.customizeButtons(primary: hotTeaButton, primaryImage: selectedButtons.hotTea.image, secondaryOne: frappucinoButton, secondaryOneImage: unSelectedButtons.frappucino.image, secondaryTwo: hotCoffeeButton, secondaryTwoImage: unSelectedButtons.hotCoffee.image)
        reloadData(newData: SwitchCollectionViewCell.Cell.hotTea.cell)
    }
    
    
    
    
    // MARK: - Methods
    private func setupCollectionView() {
        let layout = CollectionViewPagingLayout()
        layout.numberOfVisibleItems = nil
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.register(HomeMainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.dataSource = self
        self.view.addSubview(self.collectionView)
    }
    
    
    func reloadData(newData: [(image: UIImage?, name: String)]){
        self.data = newData
        self.collectionView.reloadData()
    }
    
   
}


// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeMainCollectionViewCell
        let drinks = data[indexPath.item]
        cell.image.image = drinks.image
        cell.name.text = drinks.name
        return cell
    }
    
}

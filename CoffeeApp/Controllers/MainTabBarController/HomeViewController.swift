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
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var orderedDrinkBG: UIView!
    @IBOutlet weak var orderedDrinkImage: UIImageView!
    @IBOutlet weak var orderedDrinkName: UILabel!
    
    // MARK: - Variables & Constants
    let selectedButtons = SwitchButtons.SelectedButtons.self
    let unSelectedButtons = SwitchButtons.unSelectedButtons.self
    var collectionView: UICollectionView!
    var data = DataManager.shared.frappuccinos
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupView()
        NotificationCenter.default.addObserver(self, selector: #selector(addedToCart(_:)), name: NSNotification.Name(rawValue: "added to cart"), object: nil)
    }
    
    deinit{
        NotificationCenter.default
           .removeObserver(self, name:  NSNotification.Name("added to cart"), object: nil)
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
    
    @IBAction func didTappedCartButton(_ sender: UIButton){
        cartView.isHidden = false
    }
    
    @IBAction func didTappedHideCartButton(_ sender: UIButton){
        cartView.isHidden = true
    }
    
    
    
    
    // MARK: - Methods
    @objc func addedToCart(_ notification: Notification){
        let userInfo = notification.userInfo?["OrderInfo"] as? [String : Any] ?? [:]
        orderedDrinkName.text = userInfo["name"] as? String
        orderedDrinkImage.image = userInfo["image"] as? UIImage
        cartButton.setImage(UIImage(named: "notEmptyCart"), for: .normal)
    }
    
    
    private func setupCollectionView() {
        let layout = CollectionViewPagingLayout()
        layout.numberOfVisibleItems = nil
        let frame = CGRect(x: 0, y: ((self.view.frame.height) - 700) / 2 , width: self.view.frame.width, height: 600)
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.register(HomeMainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        if #available(iOS 16.0, *) {
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        } else {
            // Fallback on earlier versions
        }
        self.view.addSubview(self.collectionView)
    }
    
    private func setupView(){
        cartView.layer.cornerRadius = cartView.frame.height / 2
        orderedDrinkBG.layer.cornerRadius = orderedDrinkBG.frame.height / 2
        cartView.layer.shadowColor = UIColor.gray.cgColor
        cartView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cartView.layer.shadowOpacity = 0.5
        cartView.layer.shadowRadius = 10
        cartButton.layer.cornerRadius = cartButton.frame.width / 2
        cartButton.layer.borderWidth = 3
        cartButton.layer.borderColor = CGColor(red: 156/255, green: 108/255, blue: 77/255, alpha: 1)
        self.view.sendSubviewToBack(collectionView)
        overrideUserInterfaceStyle = .light
        self.collectionView.reloadData()
    }
    
    
    private func reloadData(newData: [(image: UIImage?, name: String, price: String)]){
        self.data = newData
        self.collectionView.reloadData()
    }
    
   
}


// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sheet = storyboard.instantiateViewController(withIdentifier: "orderSheetViewController") as! OrderSheetViewController
        let data = data[indexPath.item]
        sheet.set(data: (image: data.image, name: data.name, price: data.price))
        self.present(sheet, animated: true, completion: nil)
    }
    
}


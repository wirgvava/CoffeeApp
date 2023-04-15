//
//  OnboardingViewController.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit


class OnboardingViewController: UIViewController {
    
    var photos = [UIImage(named: "slide1"), UIImage(named: "slide2"), UIImage(named: "slide3")]
    override var prefersStatusBarHidden: Bool { return true }
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        overrideUserInterfaceStyle = .light
    }
    
    
    // MARK: - Actions
    @IBAction func didTappedLoginBtn(_ sender: Any) {
        performSegue(withIdentifier: "showLogin", sender: nil)
    }
    
    @IBAction func didTappedRegisterBtn(_ sender: Any) {
        performSegue(withIdentifier: "showRegister", sender: nil)
    }
    
    // MARK: - Methods
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupView(){
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = CGColor(red: 186/255, green: 128/255, blue: 104/255, alpha: 1)
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
}


// MARK: - CollectionView
extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardCell", for: indexPath) as! OnboardCollectionViewCell
        cell.configure(photo: photos, indexPath: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = index
    }
    
}

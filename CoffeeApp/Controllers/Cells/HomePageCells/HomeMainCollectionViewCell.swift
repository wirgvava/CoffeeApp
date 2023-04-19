//
//  HomeMainCollectionViewCell.swift
//  CoffeeApp
//
//  Created by konstantine on 18.04.23.
//

import UIKit
import CollectionViewPagingLayout

class HomeMainCollectionViewCell: UICollectionViewCell {
    
    var card: UIView!
    var image = UIImageView()
    var name = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupImage()
        setupNameOfDricnk()
//        PresenterManager.shared.navigate(to: .orderPage)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupImage()
        setupNameOfDricnk()
    }

    func setup() {
        let cardFrame = CGRect(x: ((self.frame.width) - 250) / 2, y: ((self.frame.height) - 250) / 2, width: 250, height: 250)
        card = UIView(frame: cardFrame)
        card.layer.cornerRadius = 20
        card.backgroundColor = UIColor(red: 248/255, green: 230/255, blue: 212/255, alpha: 1)
        contentView.addSubview(card)
    }
    
    func setupImage(){
        image.frame = CGRect(x: ((self.card.frame.width) - 300) / 2, y: ((self.card.frame.height) - 300) / 2, width: 300, height: 300)
        image.contentMode = .scaleAspectFit
        image.layer.shadowColor = UIColor.brown.cgColor
        image.layer.shadowOffset = CGSize(width: 0, height: 0)
        image.layer.shadowOpacity = 0.5
        image.layer.shadowRadius = 10
        card.addSubview(image)
    }
    
    func setupNameOfDricnk(){
        name.font = .boldSystemFont(ofSize: 38)
        name.textColor = UIColor(red: 156/255, green: 108/255, blue: 77/255, alpha: 1)
        name.textAlignment = .left
        name.numberOfLines = 0
        name.frame = CGRect(x: 20, y: (self.card.frame.height) + 50, width: self.frame.width, height: 100)
        card.addSubview(name)
    }
    
    
}

//extension HomeMainCollectionViewCell: ScaleTransformView {
//    var scaleOptions: ScaleTransformViewOptions {
//        .layout(.rotary)
//    }
//}


extension HomeMainCollectionViewCell: ScaleTransformView {
    var scaleOptions: ScaleTransformViewOptions {
        ScaleTransformViewOptions(
            minScale: 0.6,
            scaleRatio: 0.4,
            translationRatio: CGPoint(x: 0.66, y: 0.2),
            maxTranslationRatio: CGPoint(x: 2, y: 0)
            )
    }
}

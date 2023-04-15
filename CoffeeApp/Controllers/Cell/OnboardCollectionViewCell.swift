//
//  OnboardCollectionViewCell.swift
//  CoffeeApp
//
//  Created by konstantine on 12.04.23.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var photos: UIImageView!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        photos.clipsToBounds = true
        photos.contentMode = .scaleAspectFill
        photos.frame = self.frame
    }
  
    // MARK: - Methods
    func configure(photo: Array<UIImage?>, indexPath: Int){
        photos.image = photo[indexPath]
    }
    
}

//
//  SideMenuTestCell.swift
//  CoffeeApp
//
//  Created by konstantine on 17.04.23.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
//    let cellBackground = UIImageView()
    var imageOfDrink = UIImageView()
    var nameOfDrink = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setBackgroundForCell(contentView: contentView)
        setNameOfDrink(contentView: contentView)
        setImageOfDrink(contentView: contentView)
    }


    func setNameOfDrink(contentView: UIView){
        nameOfDrink.font = .systemFont(ofSize: 24)
        nameOfDrink.numberOfLines = 0
        nameOfDrink.textColor = .white
        nameOfDrink.textAlignment = .center
        nameOfDrink.contentMode = .center
        contentView.addSubview(nameOfDrink)
        nameOfDrink.frame = CGRect(x: 10, y: (contentView.frame.height) - 72, width: (contentView.frame.width) - 20, height: 72)
    }
    
//    func setBackgroundForCell(contentView: UIView){
//        let frame = CGRect(x: (contentView.frame.width - 122) / 2, y: (contentView.frame.height) - (nameOfDrink.frame.height) - 151, width: 122, height: 137)
//        cellBackground.image = UIImage(named: "brownBackground")
//        cellBackground.center = contentView.center
//        cellBackground.frame = frame
//        contentView.addSubview(self.cellBackground)
//
//    }
    
    func setImageOfDrink(contentView: UIView){
        let width = Int((imageOfDrink.image?.size.width ?? contentView.frame.width))
        let height = Int((contentView.frame.height) - (nameOfDrink.frame.height) - 10)
        let x = (Int(contentView.frame.width) - width) / 2
        imageOfDrink.contentMode = .scaleAspectFit
        contentView.addSubview(imageOfDrink)
        imageOfDrink.frame = CGRect(x: x, y: 0, width: width, height: height)
    }
    
}

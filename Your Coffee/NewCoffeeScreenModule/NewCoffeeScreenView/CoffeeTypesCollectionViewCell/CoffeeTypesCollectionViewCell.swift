//
//  CoffeeTypesCollectionViewCell.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class CoffeeTypesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        coffeeImageView.layer.cornerRadius = 20
        coffeeImageView.layer.masksToBounds = true
    }
    
    func configureCell(with type: CoffeeType) {
        coffeeImageView.image = UIImage(named: type.rawValue)
        coffeeNameLabel.text = type.rawValue
    }
}

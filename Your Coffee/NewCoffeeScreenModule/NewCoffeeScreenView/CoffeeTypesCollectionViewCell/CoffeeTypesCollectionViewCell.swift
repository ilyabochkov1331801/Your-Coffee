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
        layer.cornerRadius = 20
        coffeeImageView.layer.borderWidth = 1
        coffeeImageView.layer.borderColor = #colorLiteral(red: 0.4947935939, green: 0.3483881354, blue: 0.2426223457, alpha: 1)
    }
    
    func configureCell(with type: CoffeeType) {
        coffeeImageView.image = UIImage(named: type.rawValue)
        coffeeNameLabel.text = type.rawValue
    }
}

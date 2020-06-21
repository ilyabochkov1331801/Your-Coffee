//
//  CoffeeTableViewCell.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var coffeeDateLabel: UILabel!
    
    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coffeeImageView.layer.cornerRadius = 10
        coffeeImageView.layer.masksToBounds = true
        coffeeImageView.layer.borderWidth = 1
        coffeeImageView.layer.borderColor = #colorLiteral(red: 0.4947935939, green: 0.3483881354, blue: 0.2426223457, alpha: 1)
        contentView.layer.cornerRadius = 10
    }
    
    func configureCell(with coffee: Coffee?) {
        guard let coffee = coffee else {
            return
        }
        coffeeNameLabel.text = coffee.name
        coffeeDateLabel.text = dateFormatter.string(from: coffee.date)
        coffeeImageView.image = UIImage(named: coffee.imageName)
    }
    
}

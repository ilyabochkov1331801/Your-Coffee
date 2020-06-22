//
//  DetailScreenViewController.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/22/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    let smallCoffeeCupImageName = "Small Coffee Cup"
    let mediumCoffeeCupImageName = "Medium Coffee Cup"
    let largeCoffeeCupImageName = "Large Coffee Cup"
    let cellIdentifier = "Ingredient cell"

    var presenter: DetailScreenPresenterProtocol?
    
    @IBOutlet weak var headerView: UIView! {
        didSet {
            headerView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var firstBridgeView: UIView! {
        didSet {
            firstBridgeView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var secondBridgeView: UIView! {
        didSet {
            secondBridgeView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var footerView: UIView! {
        didSet {
            footerView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var ingredientCollectionView: UICollectionView!

    @IBOutlet weak var coffeeImageView: UIImageView! {
        didSet {
            coffeeImageView.layer.cornerRadius = 10
            coffeeImageView.layer.masksToBounds = true
            coffeeImageView.layer.borderWidth = 1
            coffeeImageView.layer.borderColor = #colorLiteral(red: 0.4947935939, green: 0.3483881354, blue: 0.2426223457, alpha: 1)
        }
    }
    
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var beansLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var coffeeSizeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateCoffeeInfo()
        ingredientCollectionView.delegate = self
        ingredientCollectionView.dataSource = self
        
        ingredientCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailScreenViewController: DetailScreenViewProtocol {
    
    func set(coffeeImage withName: String) {
        coffeeImageView.image = UIImage(named: withName)
    }
    
    func set(coffeeName: String) {
        coffeeNameLabel.text = coffeeName
    }
    
    func set(coffeeSize: Size) {
        switch coffeeSize {
        case .small:
            coffeeSizeImageView.image = UIImage(named: smallCoffeeCupImageName)
        case .medium:
            coffeeSizeImageView.image = UIImage(named: mediumCoffeeCupImageName)
        case .large:
            coffeeSizeImageView.image = UIImage(named: largeCoffeeCupImageName)
        
        }
    }
    
    func set(description: String) {
        descriptionLabel.text = description
    }
    
    func set(beans: String) {
        beansLabel.text = beans
    }
    
    func set(time: String) {
        timeLabel.text = time
    }
}

extension DetailScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.coffeeInfo.ingredients.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ingredientCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        if let imageName = presenter?.coffeeInfo.ingredients[indexPath.row].imageName {
            let imageView = UIImageView(frame: cell.contentView.bounds)
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFill
            cell.contentView.addSubview(imageView)
        }
        return cell
    }
}

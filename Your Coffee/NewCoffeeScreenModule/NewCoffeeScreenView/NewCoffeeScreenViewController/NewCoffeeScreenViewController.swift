//
//  NewCoffeeScreenViewController.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class NewCoffeeScreenViewController: UIViewController {
    
    private let cellNibName = "CoffeeTypesCollectionViewCell"
    private let cellIdentifier = "Coffee cell"

    var presenter: NewCoffeeScreenPresenterProtocol?
    
    @IBOutlet weak var beansSegmentedControl: UISegmentedControl!
    @IBOutlet weak var coffeeTypesCollectionView: UICollectionView!
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coffeeTypesCollectionView.delegate = self
        coffeeTypesCollectionView.dataSource = self
        coffeeTypesCollectionView.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        presenter?.set(coffeeBeans: .arabica)
        presenter?.set(size: .small)
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        presenter?.addNewCoffee()
    }
    
    @IBAction func coffeeBeansSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        var coffeeBeans: CoffeeBeans!
        switch sender.selectedSegmentIndex {
        case 0:
            coffeeBeans = .arabica
        case 1:
            coffeeBeans = .robusta
        case 2:
            coffeeBeans = .liberica
        default:
            break
        }
        presenter?.set(coffeeBeans: coffeeBeans)
    }
    
    @IBAction func sizeSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        var size: Size!
        switch sender.selectedSegmentIndex {
        case 0:
            size = .small
        case 1:
            size = .medium
        case 2:
            size = .large
        default:
            break
        }
        presenter?.set(size: size)
    }
}

extension NewCoffeeScreenViewController: NewCoffeeScreenViewProtocol {
    func propertiesUpdated() {
        addButton.isEnabled = presenter?.newCoffee?.isConfirm ?? false
    }
    
    func addingNewCoffeeFinished(with error: Error) {
        print(error.localizedDescription)
    }
}

extension NewCoffeeScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CoffeeType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CoffeeTypesCollectionViewCell
        cell.configureCell(with: CoffeeType.allCases[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.isHighlighted = true
        presenter?.set(coffeeType: CoffeeType.allCases[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.isHighlighted = false
    }
}

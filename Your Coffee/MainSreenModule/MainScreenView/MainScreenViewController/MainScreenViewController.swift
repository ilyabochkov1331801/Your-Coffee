//
//  MainScreenViewController.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private let cellNibName = "CoffeeTableViewCell"
    private let cellIdentifier = "CoffeeCell"
    private let caffeinePercentageIndicatorMaxHeight = 150.0

    var presenter: MainScreenPresenterProtocol?
    
    @IBOutlet weak var coffeeListTableView: UITableView!
    @IBOutlet weak var caffeinePercentageIndicatorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeListTableView.delegate = self
        coffeeListTableView.dataSource = self
        
        coffeeListTableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        coffeeListTableView.rowHeight = 120
        
        presenter?.updateTodayCoffeeList()
    }
    
    @IBAction func addNewCoffeeButtonTapped(_ sender: UIButton) {
        presenter?.addNewCoffee()
    }
}


extension MainScreenViewController: MainScreenViewProtocol {
    func successTodayCoffeeListUpdate() {
        self.coffeeListTableView.reloadData()
        self.view.layer.layoutIfNeeded()
        UIView.animate(withDuration: 1) {
            self.caffeinePercentageIndicatorHeight.constant = CGFloat(self.caffeinePercentageIndicatorMaxHeight * (self.presenter?.todayCoffeeListStorage?.caffeinePercentage ?? 0.0))
            self.view.layer.layoutIfNeeded()
        }
    }
    
    func todayCoffeeListUpdatingFinished(with error: Error) {
        configureAlert(with: error)
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.todayCoffeeListStorage?.todayCoffeeList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CoffeeTableViewCell
        cell.configureCell(with: presenter?.todayCoffeeListStorage?.todayCoffeeList[indexPath.row])
        return cell
    }
}

extension MainScreenViewController {
    private func configureAlert(with error: Error) {
        let errorAlert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okErrorAlertAction = UIAlertAction(title: "OK", style: .default)
        errorAlert.addAction(okErrorAlertAction)
        present(errorAlert, animated: true)
    }
}

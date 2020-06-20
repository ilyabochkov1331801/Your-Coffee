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

    var presenter: MainScreenPresenterProtocol?
    @IBOutlet weak var coffeeListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeListTableView.delegate = self
        coffeeListTableView.dataSource = self
        
        coffeeListTableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        coffeeListTableView.rowHeight = 120
        
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
}


extension MainScreenViewController: MainScreenViewProtocol {
    func successTodayCoffeeListUpdate() {
        
    }
    func todayCoffeeListUpdatingFinished(with error: Error) {
        
    }
}

extension MainScreenViewController: UITableViewDelegate {
    
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

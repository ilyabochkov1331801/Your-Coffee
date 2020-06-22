//
//  MainScreenPresenterProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol MainScreenPresenterProtocol: class {
    var router: RouterProtocol { get }
    var storageService: StorageServiceProtocol { get }
    var view: MainScreenViewProtocol? { get }
    var todayCoffeeListStorage: TodayCoffeeListStorage? { get }
    init(view: MainScreenViewProtocol, storageService: StorageServiceProtocol, router: RouterProtocol)
    
    func updateTodayCoffeeList()
    func addNewCoffee()
    func detailInfo(about coffee: Coffee?)
    
    func append(newCoffee: Coffee)
}

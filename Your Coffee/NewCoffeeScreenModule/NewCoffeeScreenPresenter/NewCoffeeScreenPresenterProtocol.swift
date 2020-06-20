//
//  NewCoffeeScreenPresenterProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol NewCoffeeScreenPresenterProtocol: class {
    var router: RouterProtocol { get }
    var storageService: StorageServiceProtocol { get }
    var view: NewCoffeeScreenViewProtocol? { get }
    var newCoffee: NewCoffee? { get }
    init(view: NewCoffeeScreenViewProtocol, storageService: StorageServiceProtocol, router: RouterProtocol)
    
    func addNewCoffee()
    func set(coffeeType: CoffeeType)
    func set(coffeeBeans: CoffeeBeans)
    func set(size: Size)
}

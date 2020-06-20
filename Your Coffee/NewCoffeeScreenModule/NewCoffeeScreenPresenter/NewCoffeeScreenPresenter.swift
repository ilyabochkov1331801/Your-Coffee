//
//  NewCoffeeScreenPresenter.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class NewCoffeeScreenPresenter: NewCoffeeScreenPresenterProtocol {
    var router: RouterProtocol
    var storageService: StorageServiceProtocol
    var view: NewCoffeeScreenViewProtocol?
    var newCoffee: NewCoffee?
    
    required init(view: NewCoffeeScreenViewProtocol, storageService: StorageServiceProtocol, router: RouterProtocol) {
        self.router = router
        self.storageService = storageService
        self.view = view
        newCoffee = NewCoffee()
    }
    
    func addNewCoffee() {
        storageService.addNewCoffee(type: newCoffee!.coffeeType!,
                                    beans: newCoffee!.beans!,
                                    size: newCoffee!.coffeeSize!) {
                                       [weak self] (result) in
                                        guard let self = self else { return }
                                        switch result {
                                        case .success(let coffee):
                                            self.router.popToRoot()
                                        case .failure(let error):
                                            self.view?.addingNewCoffeeFinished(with: error)
                                        }
        }
    }
    
    func set(coffeeType: CoffeeType) {
        newCoffee?.coffeeType = coffeeType
        view?.propertiesUpdated()
    }
    
    func set(coffeeBeans: CoffeeBeans) {
        newCoffee?.beans = coffeeBeans
        view?.propertiesUpdated()
    }
    
    func set(size: Size) {
        newCoffee?.coffeeSize = size
        view?.propertiesUpdated()
    }
}

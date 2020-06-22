//
//  DetailScreenPresenter.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/22/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class DetailScreenPresenter: DetailScreenPresenterProtocol {
    var view: DetailScreenViewProtocol?
    var coffeeInfo: Coffee
    var router: RouterProtocol
    
    private var dateFormatter: DateFormatter = {
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .none
           dateFormatter.timeStyle = .medium
           return dateFormatter
       }()
    
    required init(view: DetailScreenViewProtocol, router: RouterProtocol, coffee: Coffee) {
        self.view = view
        self.coffeeInfo = coffee
        self.router = router
    }
    
    func updateCoffeeInfo() {
        view?.set(coffeeName: coffeeInfo.name)
        view?.set(coffeeImage: coffeeInfo.imageName)
        view?.set(coffeeSize: Size(rawValue: coffeeInfo.volume)!)
        view?.set(beans: coffeeInfo.base.beans.rawValue)
        view?.set(description: coffeeInfo.description)
        view?.set(time: dateFormatter.string(from: coffeeInfo.date))
    }
}

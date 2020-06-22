//
//  DetailScreenPresenterProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/22/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol DetailScreenPresenterProtocol {
    var view: DetailScreenViewProtocol? { get }
    var coffeeInfo: Coffee { get }
    var router: RouterProtocol { get }
    init(view: DetailScreenViewProtocol, router: RouterProtocol, coffee: Coffee)
    
    func updateCoffeeInfo()
}

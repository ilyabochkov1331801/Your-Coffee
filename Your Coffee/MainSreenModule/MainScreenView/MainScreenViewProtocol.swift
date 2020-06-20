//
//  MainScreenViewProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol MainScreenViewProtocol: class {
    var presenter: MainScreenPresenterProtocol? { get set }
    
    func successTodayCoffeeListUpdate()
    func todayCoffeeListUpdatingFinished(with error: Error)
}

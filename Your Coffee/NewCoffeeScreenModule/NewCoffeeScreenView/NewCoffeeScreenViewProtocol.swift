//
//  NewCoffeeScreenViewProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol NewCoffeeScreenViewProtocol: class {
    var presenter: NewCoffeeScreenPresenterProtocol? { get set }
    
    func propertiesUpdated()
    func addingNewCoffeeFinished(with error: Error)
}

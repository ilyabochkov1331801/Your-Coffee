//
//  StorageServiceProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol StorageServiceProtocol {
    func todayCoffeeList(completion: @escaping (Result<Array<Coffee>, Error>) -> ())
    func addNewCoffee(type: CoffeeType, beans: CoffeeBeans, size: Size, completion: @escaping (Result<Coffee, Error>) -> ())
}

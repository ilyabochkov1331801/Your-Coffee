//
//  Coffee.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/18/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol Coffee {
    var name: String { get }
    var description: String { get }
    var imageName: String { get }

    var volume: Int { get set }
    var base: CoffeeBase { get }
    var date: Date { get }
    var ingredients: Array<Ingredient> { get }
    init(volume: Int, beans: CoffeeBeans)
}

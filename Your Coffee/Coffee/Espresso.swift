//
//  Espresso.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class Espresso: Coffee {
    var name: String = "Эспрессо"
    var description: String = "Метод приготовления кофе путём прохождения горячей воды (около 90 °C) под давлением 9 бар через фильтр с молотым кофе"
    var imageName: String = "Эспрессо"
    
    var volume: Int
    var base: CoffeeBase
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans) {
        self.volume = volume
        date = Date()
        base = EspressoBase(beans: beans)
        ingredients = [ ]
    }
}

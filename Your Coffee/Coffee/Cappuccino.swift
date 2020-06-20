//
//  Cappuccino.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/19/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class Cappuccino: Coffee {

    var name: String = "Капучино"
    var description: String = "Кофейный напиток итальянской кухни на основе эспрессо с добавлением в него подогретого вспененного молока"
    var imageName: String = "Капучино"
    
    var volume: Int
    var base: CoffeeBase
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans) {
        self.volume = volume
        date = Date()
        base = EspressoBase(beans: beans)
        ingredients = [ Milk(), FrothedMilk() ]
    }
}

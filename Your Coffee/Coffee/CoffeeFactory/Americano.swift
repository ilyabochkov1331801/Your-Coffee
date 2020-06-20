//
//  Americano.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class Americano: Coffee {
    var name: String = "Американо"
    var description: String = "Способ приготовления кофе, заключающийся в соединении определённого количества горячей воды и эспрессо"
    var imageName: String = "americano"
    
    var volume: Int
    var base: CoffeeBase
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans) {
        self.volume = volume
        date = Date()
        base = EspressoBase(beans: beans)
        ingredients = [ Water() ]
    }
}

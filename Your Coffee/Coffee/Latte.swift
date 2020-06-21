//
//  Latte.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/18/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class Latte: Coffee {

    var name: String = "Латте"
    var description: String = "Кофейный напиток родом из Италии, состоящий из молока и кофе эспрессо. Варится на основе молока, образуя в чашке или бокале трёхслойную смесь из кофе, молока и пены"
    var imageName: String = "Латте"

    var base: CoffeeBase
    var volume: Int
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans, date: Date) {
        self.volume = volume
        self.date = date
        base = EspressoBase(beans: beans)
        ingredients = [ Milk(), FrothedMilk() ]
    }
}

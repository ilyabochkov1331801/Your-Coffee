//
//  DoubleEspresso.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class DoubleEspresso: Coffee {
    var name: String = "Двойной эспрессо"
    var description: String = "Представляет из себя двойную порцию эспрессо"
    var imageName: String = "doubleEspresso"
    
    var volume: Int
    var base: CoffeeBase
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans) {
        self.volume = volume
        date = Date()
        base = DoubleEspressoBase(beans: beans)
        ingredients = [ ]
    }
}

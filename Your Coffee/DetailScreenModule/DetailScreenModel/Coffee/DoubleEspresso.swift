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
    var imageName: String = "Двойной эспрессо"
    
    var volume: Int
    var base: CoffeeBase
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans, date: Date) {
        self.volume = volume
        self.date = date
        base = DoubleEspressoBase(beans: beans)
        ingredients = [ ]
    }
}

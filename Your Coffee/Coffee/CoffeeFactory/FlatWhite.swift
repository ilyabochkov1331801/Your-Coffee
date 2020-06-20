//
//  FlatWhite.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class FlatWhite: Coffee {
    var name: String = "Флэт Уайт"
    var description: String = "Кофейный напиток родом из Австралии, придуманный в 1980-х годах. Готовится путём добавления нагретого паром молока с небольшим количеством пены (0,5 см) в двойную порцию эспрессо."
    var imageName: String = "flatWhite"
    
    var volume: Int
    var base: CoffeeBase
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans) {
        self.volume = volume
        date = Date()
        base = DoubleEspressoBase(beans: beans)
        ingredients = [ Milk(), FrothedMilk() ]
    }
}

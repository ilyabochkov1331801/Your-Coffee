//
//  Raf.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class Raf: Coffee {
    var name: String = "Раф"
    var description: String = "Популярный в России и странах бывшего СССР кофейный напиток, появившийся в конце 2000-х годов. Готовится путём добавления нагретых паром сливок с небольшим количеством пены (0,5 см) в одиночную порцию эспрессо. Основное отличие от латте — в использовании ванильного сахара и сливок вместо молока. Часто подаётся с сиропом"
    var imageName: String = "Раф"
    
    var volume: Int
    var base: CoffeeBase
    var date: Date
    var ingredients: Array<Ingredient>
    
    required init(volume: Int, beans: CoffeeBeans, date: Date) {
        self.volume = volume
        self.date = date
        base = EspressoBase(beans: beans)
        ingredients = [ Cream(), VanillaSugar() ]
    }
}

//
//  Espresso.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

struct EspressoBase: CoffeeBase {
    var name: String = "Эспрессо"
    var beans: CoffeeBeans
    
    init(beans: CoffeeBeans) {
        self.beans = beans
    }
}

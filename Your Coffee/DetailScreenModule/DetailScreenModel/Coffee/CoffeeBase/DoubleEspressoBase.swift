//
//  DoubleEspressoBase.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

struct DoubleEspressoBase: CoffeeBase {
    var name: String = "Двойной эспрессо"
    var beans: CoffeeBeans
    
    init(beans: CoffeeBeans) {
        self.beans = beans
    }
}

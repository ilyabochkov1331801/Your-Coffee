//
//  NewCoffee.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class NewCoffee {
    var coffeeType: CoffeeType?
    var coffeeSize: Size?
    var beans: CoffeeBeans?
    
    var isConfirm: Bool {
        guard let _ = coffeeType,
            let _ = coffeeSize,
            let _ = beans else {
                return false
        }
        return true
    }
}

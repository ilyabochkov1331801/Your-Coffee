//
//  CoffeeType.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/19/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

enum CoffeeType: String {    
    case latte = "latte"
    case cappuccino = "cappuccino"
    case flatWhite = "flatWhite"
    case espresso = "espresso"
    case doubleEspresso = "doubleEspresso"
    case americano = "americano"
    case raf = "raf"
}

extension CoffeeType: CaseIterable {}

//
//  CoffeeType.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/19/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

enum CoffeeType: String {    
    case latte = "Латте"
    case cappuccino = "Капучино"
    case flatWhite = "Флэт Уайт"
    case espresso = "Эспрессо"
    case doubleEspresso = "Двойной эспрессо"
    case americano = "Американо"
    case raf = "Раф"
}

extension CoffeeType: CaseIterable {}

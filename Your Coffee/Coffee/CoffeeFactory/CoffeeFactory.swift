//
//  CoffeFactory.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/19/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class CoffeeFactory: CoffeeFactoryProtocol {
    static func coffee(with type: CoffeeType, size: Size, beans: CoffeeBeans) -> Coffee {
        return CoffeeFactory.coffee(with: type, volume: size.rawValue, beans: beans)
    }
    
    static func coffee(with type: CoffeeType, volume: Int, beans: CoffeeBeans) -> Coffee {
        switch type {
        case .latte:
            return Latte(volume: volume, beans: beans)
        case .cappuccino:
            return Cappuccino(volume: volume, beans: beans)
        case .flatWhite:
            return FlatWhite(volume: volume, beans: beans)
        case .espresso:
            return Espresso(volume: volume, beans: beans)
        case .doubleEspresso:
            return DoubleEspresso(volume: volume, beans: beans)
        case .americano:
            return Americano(volume: volume, beans: beans)
        case .raf:
            return Raf(volume: volume, beans: beans)
        }
    }
}

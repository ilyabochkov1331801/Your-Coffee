//
//  CoffeFactory.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/19/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class CoffeeFactory: CoffeeFactoryProtocol {
    static func coffee(with type: CoffeeType, size: Size, beans: CoffeeBeans, date: Date) -> Coffee {
        return CoffeeFactory.coffee(with: type, volume: size.rawValue, beans: beans, date: date)
    }
    
    static func coffee(with type: CoffeeType, volume: Int, beans: CoffeeBeans, date: Date) -> Coffee {
        switch type {
        case .latte:
            return Latte(volume: volume, beans: beans, date: date)
        case .cappuccino:
            return Cappuccino(volume: volume, beans: beans, date: date)
        case .flatWhite:
            return FlatWhite(volume: volume, beans: beans, date: date)
        case .espresso:
            return Espresso(volume: volume, beans: beans, date: date)
        case .doubleEspresso:
            return DoubleEspresso(volume: volume, beans: beans, date: date)
        case .americano:
            return Americano(volume: volume, beans: beans, date: date)
        case .raf:
            return Raf(volume: volume, beans: beans, date: date)
        }
    }
}

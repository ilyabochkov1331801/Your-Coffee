//
//  CoffeeFactoryProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol CoffeeFactoryProtocol {
    static func coffee(with type: CoffeeType, size: Size, beans: CoffeeBeans) -> Coffee
    static func coffee(with type: CoffeeType, volume: Int, beans: CoffeeBeans) -> Coffee
}

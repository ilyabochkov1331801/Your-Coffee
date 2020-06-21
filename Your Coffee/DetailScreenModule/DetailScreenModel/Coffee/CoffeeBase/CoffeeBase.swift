//
//  CoffeeBase.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

protocol CoffeeBase {
    var name: String { get }
    var beans: CoffeeBeans { get }
    init(beans: CoffeeBeans)
}

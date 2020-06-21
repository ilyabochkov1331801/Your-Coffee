//
//  TodayCoffeeList.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class TodayCoffeeListStorage {
    private let maxCaffeine = 4.0
    
    var todayCoffeeList: Array<Coffee> {
        didSet {
            calculateCaffeinePercentage()
        }
    }
    var caffeinePercentage: Double?
    
    init(with newTodayCoffeeList: Array<Coffee>) {
        todayCoffeeList = newTodayCoffeeList
        calculateCaffeinePercentage()
    }
    
    private func calculateCaffeinePercentage() {
        var caffeine = 0.0
        todayCoffeeList.forEach {
            (coffee) in
            switch coffee.base {
            case is EspressoBase:
                caffeine += 1.0
            case is DoubleEspressoBase:
                caffeine += 2.0
            default:
                break
            }
        }
        caffeinePercentage = min(caffeine / maxCaffeine, 1.0)
    }
}

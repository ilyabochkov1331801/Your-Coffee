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
    var caffeinePercentage: Int?
    
    init(with newTodayCoffeeList: Array<Coffee>) {
        todayCoffeeList = newTodayCoffeeList
    }
    
    private func calculateCaffeinePercentage() {
        var caffeine = 0.0
        todayCoffeeList.forEach {
            (coffee) in
            switch coffee.base {
            case is Espresso:
                caffeine += 1.0
            case is DoubleEspresso:
                caffeine += 2.0
            default:
                break
            }
        }
        caffeinePercentage = Int( caffeine / maxCaffeine * 100 )
    }
}

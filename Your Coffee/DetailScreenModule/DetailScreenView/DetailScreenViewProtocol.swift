//
//  DetailScreenViewProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/22/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation


protocol DetailScreenViewProtocol {
    var presenter: DetailScreenPresenterProtocol? { get set }
    
    func set(coffeeImage withName: String)
    func set(coffeeName: String)
    func set(coffeeSize: Size)
    func set(description: String)
    func set(beans: String)
    func set(time: String)
}

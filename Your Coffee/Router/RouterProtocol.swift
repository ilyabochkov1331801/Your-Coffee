//
//  RouterProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? { get }
    var mainScreen: UIViewController? { get }
    var currentScreen: UIViewController? { get }
    var screenModuleBuilder: ScreenModuleBuilderProtocol { get }
    init(screenModuleBuilder: ScreenModuleBuilderProtocol)
    
    func initialMainScreen()
    func showNewCoffeeScreen()
    func showDetailScreen(with coffee: Coffee)
    func dismissToMainScreen(with newCoffee: Coffee)
    func popToMainScreen()
}

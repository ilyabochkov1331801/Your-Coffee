//
//  Router.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var screenModuleBuilder: ScreenModuleBuilderProtocol?
    
    required init(navigationController: UINavigationController, screenModuleBuilder: ScreenModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.screenModuleBuilder = screenModuleBuilder
    }
    
    func showMainScreen() {
        guard let navigationController = navigationController,
            let mainScreen = screenModuleBuilder?.mainScreen(router: self) else {
            return
        }
        navigationController.viewControllers = [ mainScreen ]
    }
    
    func showNewCoffeeScreen() {
        guard let navigationController = navigationController,
            let newCoffeeScreen = screenModuleBuilder?.newCoffeeScreen(router: self) else {
            return
        }
        navigationController.pushViewController(newCoffeeScreen, animated: true)
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}

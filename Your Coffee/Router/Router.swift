//
//  Router.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class Router: RouterProtocol {
    var mainScreen: UIViewController?
    var currentScreen: UIViewController?
    var screenModuleBuilder: ScreenModuleBuilderProtocol?
    
    required init( screenModuleBuilder: ScreenModuleBuilderProtocol) {
        self.screenModuleBuilder = screenModuleBuilder
    }
    
    func initialMainScreen() {
        mainScreen = screenModuleBuilder?.mainScreen(router: self)
        currentScreen = mainScreen
    }
    
    func showNewCoffeeScreen() {
        guard let mainScreen = mainScreen,
            let newCoffeeScreen = screenModuleBuilder?.newCoffeeScreen(router: self) else {
            return
        }
        mainScreen.present(newCoffeeScreen, animated: true)
        self.currentScreen = newCoffeeScreen
    }
    
    func popToMainScreen(with newCoffee: Coffee) {
        guard let currentScreen = currentScreen else {
            return
        }
        currentScreen.dismiss(animated: true)
        (mainScreen as! MainScreenViewProtocol).presenter?.todayCoffeeListStorage?.todayCoffeeList.append(newCoffee)
        (mainScreen as! MainScreenViewProtocol).successTodayCoffeeListUpdate()
        self.currentScreen = nil
    }
}

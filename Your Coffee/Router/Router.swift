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
    var mainScreen: UIViewController?
    var currentScreen: UIViewController?
    var screenModuleBuilder: ScreenModuleBuilderProtocol
    
    required init( screenModuleBuilder: ScreenModuleBuilderProtocol) {
        self.screenModuleBuilder = screenModuleBuilder
        navigationController = UINavigationController()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7437288165, green: 0.6705283523, blue: 0.4879803658, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func initialMainScreen() {
        mainScreen = screenModuleBuilder.mainScreen(router: self)
        navigationController?.viewControllers = [ mainScreen! ]
    }
    
    func showNewCoffeeScreen() {
        let newCoffeeScreen = screenModuleBuilder.newCoffeeScreen(router: self)
        mainScreen?.present(newCoffeeScreen, animated: true)
        self.currentScreen = newCoffeeScreen
    }
    
    func dismissToMainScreen(with newCoffee: Coffee) {
        currentScreen?.dismiss(animated: true)
        (mainScreen as! MainScreenViewProtocol).presenter?.append(newCoffee: newCoffee)
        self.currentScreen = nil
    }
    
    func showDetailScreen(with coffee: Coffee) {
        navigationController?.pushViewController(screenModuleBuilder.detailScreen(with: coffee,
                                                                                  router: self),
                                                 animated: true)
        
    }
    
    func popToMainScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}

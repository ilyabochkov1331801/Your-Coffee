//
//  ScreenModuleBuilder.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

class ScreenModuleBuilder: ScreenModuleBuilderProtocol {
    func mainScreen(router: RouterProtocol) -> UIViewController {
        let view = MainScreenViewController()
        let storageService = StorageService()
        let presenter = MainScreenPresenter(view: view,
                                          storageService: storageService,
                                          router: router)
        view.presenter = presenter
        return view
    }
    
    func newCoffeeScreen(router: RouterProtocol) -> UIViewController {
        let view = NewCoffeeScreenViewController()
        let storageService = StorageService()
        let presenter = NewCoffeeScreenPresenter(view: view,
                                          storageService: storageService,
                                          router: router)
        view.presenter = presenter
        return view
    }
    
    func detailScreen(with coffee: Coffee, router: RouterProtocol) -> UIViewController {
        return UIViewController()
    }
}

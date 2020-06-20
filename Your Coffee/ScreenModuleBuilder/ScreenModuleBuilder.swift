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
        let presenter = MainViewPresenter(view: view,
                                          storageService: storageService,
                                          router: router)
        view.presenter = presenter
        return view
    }
}

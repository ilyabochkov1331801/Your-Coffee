//
//  MainScreenPresenter.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import Foundation

class MainViewPresenter: MainScreenPresenterProtocol {
    var router: RouterProtocol
    var storageService: StorageServiceProtocol
    weak var view: MainScreenViewProtocol?
    
    required init(view: MainScreenViewProtocol, storageService: StorageServiceProtocol, router: RouterProtocol) {
        self.router = router
        self.storageService = storageService
        self.view = view
    }
}

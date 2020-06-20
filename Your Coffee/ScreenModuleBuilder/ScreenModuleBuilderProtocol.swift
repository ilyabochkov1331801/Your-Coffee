//
//  ScreenModuleBuilderProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

protocol ScreenModuleBuilderProtocol {
    func mainScreen(router: RouterProtocol) -> UIViewController
}

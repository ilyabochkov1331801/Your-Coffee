//
//  RouterProtocol.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
    var screenModuleBuilder: ScreenModuleBuilderProtocol? { get set}
}

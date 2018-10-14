//
//  Actions.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import ReSwift
import UIKit
import Domain

enum NavigationAction: Action {
    case appDidLaunch(UIWindow, [UIApplication.LaunchOptionsKey: Any]?)
    case rootScene(TabBarController)
    case listRestaurantsScene(UINavigationController)
    case filters(UINavigationController)
}

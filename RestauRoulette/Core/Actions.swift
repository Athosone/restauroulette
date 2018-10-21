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

struct NavigationAction {
    enum Application: Action {
        case appDidLaunch(UIWindow, [UIApplication.LaunchOptionsKey: Any]?)
        case rootScene(TabBarController)
    }
    
    enum Restaurants: Action {
        case listRestaurantsScene(UINavigationController)
        case showRestaurantsDetails(restaurant: Restaurant)
    }
    
    enum Filters: Action {
        case filters(UINavigationController)
    }
}

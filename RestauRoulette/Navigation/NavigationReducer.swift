//
//  NavigationReducer.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

func navigationReducer(action: Action, state: NavigationState?) -> NavigationState {
    let currentState = state ?? NavigationState(nil, nil)

    switch (action) {
    case NavigationAction.Application.appDidLaunch(let window, let options):
        let appCoordinator = AppCoordinator(window: window, launchingOptions: options)
        return NavigationState(state?.coordinator, appCoordinator)
    case NavigationAction.Filters.filters(let rootVC) :
        return NavigationState(state?.coordinator, FiltersCoordinator(rootViewController: rootVC))
    case NavigationAction.Application.rootScene(let rootVC):
        return NavigationState(state?.coordinator, RootSceneCoordinator(rootVC))
    case let action as NavigationAction.Restaurants:
        return restaurantNavigationReducer(action: action, state: currentState)
    default:
        return currentState
    }
}

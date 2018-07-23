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
    let currentState = state ?? NavigationState(coordinator: nil)
    guard let action = action as? NavigationAction else {
        return currentState
    }

    switch (action, state?.coordinator?.rootViewController) {
    case (.didLaunch(let window, let options), _):
        let appCoordinator = AppCoordinator(window: window, launchingOptions: options)
        return NavigationState(coordinator: appCoordinator)
    case (.filters, let rootViewController as UINavigationController) :
        return NavigationState(coordinator: FiltersCoordinator(rootViewController: rootViewController))
    case (.rootScene(let coord), _):
        return NavigationState(coordinator: coord)
    case (.restaurantsScene(let coord), _):
        return NavigationState(coordinator: coord)
    default: return currentState
    }
}

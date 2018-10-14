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
    guard let action = action as? NavigationAction else {
        return currentState
    }

    switch (action) {
    case .appDidLaunch(let window, let options):
        let appCoordinator = AppCoordinator(window: window, launchingOptions: options)
        return NavigationState(state?.coordinator, appCoordinator)
    case .filters(let rootVC) :
        return NavigationState(state?.coordinator, FiltersCoordinator(rootViewController: rootVC))
    case .rootScene(let rootVC):
        return NavigationState(state?.coordinator, RootSceneCoordinator(rootVC))
    case .listRestaurantsScene(let rootVC):
        return NavigationState(state?.coordinator, ListRestaurantsCoordinator(rootVC))
    }
}

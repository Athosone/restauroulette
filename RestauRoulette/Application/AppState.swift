//
//  AppState.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import ReSwift
import Foundation

struct AppState: StateType, Codable {
    let navigationState: NavigationState
    let listRestaurantsState: ListRestaurantsState?
}

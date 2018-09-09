//
//  AppReducer.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 14/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        navigationState: navigationReducer(action: action, state: state?.navigationState),
        listRestaurantsState: nil
    )
}

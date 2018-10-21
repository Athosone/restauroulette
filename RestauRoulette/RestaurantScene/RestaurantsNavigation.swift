//
//  RestaurantsNavigation.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 21/10/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation

func restaurantNavigationReducer(action: NavigationAction.Restaurants, state: NavigationState) -> NavigationState {
    switch action {
    case .listRestaurantsScene(let rootVC):
         return NavigationState(state.coordinator, ListRestaurantsCoordinator(rootVC))
    case .showRestaurantsDetails(let restaurant):
        let restauPresenter: RestaurantPresenter? = state.coordinator as? RestaurantPresenter
        restauPresenter?.present(restaurant: restaurant)
        return state
    }
}

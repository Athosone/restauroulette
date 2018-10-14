//
//  NearestRestaurantState.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Domain
import Application

import ReSwift
import RxSwift


struct ListRestaurantsState: StateType, Codable, Equatable {
    var restaurants: [Restaurant]?
    var isLoading: Bool = false
}

enum ListTenantsActions: Action {
    case searchTenants(searchTerm: String)
    case didFindTenants(restaurants: [Restaurant])
}

func listTenantsReducer(action: Action, state: ListRestaurantsState?) -> ListRestaurantsState {
    let currentState = state ?? ListRestaurantsState(restaurants: nil, isLoading: false)
    guard let action = action as? ListTenantsActions else {
        return currentState
    }
    switch action {
    case .searchTenants(_):
        return ListRestaurantsState(restaurants: state?.restaurants, isLoading: true)
    case .didFindTenants(let restaurants):
        return ListRestaurantsState(restaurants: restaurants, isLoading: false)
    }
}

let fetchTenantsMiddleWare: Middleware<Any> = { dispatch, getState in
    var disposeBag: DisposeBag?
    return { next in
        return { action in
            guard let actionTenants = action as? ListTenantsActions else {
                return next(action)
            }
            disposeBag = DisposeBag()
            switch actionTenants {
            case .searchTenants(let searchTerm):
                let tenantUseCase = Configuration.shared.resolver.resolve(TenantUseCase.self)!
                tenantUseCase.fetchTenants(searchTerm: searchTerm)
                    .subscribe(onSuccess: { (restaurants) in
                        dispatch(ListTenantsActions.didFindTenants(restaurants: restaurants))
                    }).disposed(by: disposeBag!)
            default:
                break
            }
            
            // call next middleware
            return next(action)
        }
    }
}

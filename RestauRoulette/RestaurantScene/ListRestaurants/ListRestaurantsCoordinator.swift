//
//  RestaurantsCoordinator.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import UIKit

import ReSwift
import RxSwift

import Application
import Domain
import AthosUIKit

protocol RestaurantPresenter {
    func present(restaurant: Restaurant)
}

// MARK: - Subscribers
final class ListRestaurantsSubscriber: StoreSubscriber {
    typealias StoreSubscriberStateType = ListRestaurantsState
    
    private let publishState: BehaviorSubject<ListRestaurantsState> = BehaviorSubject(value: ListRestaurantsState())
    
    var state: Observable<ListRestaurantsState> {
        return publishState.asObservable()
    }
    
    init() {
        self.subscribe()
    }
    
    func newState(state: ListRestaurantsState) {
        self.publishState.onNext(state)
    }
    
    func subscribe() {
        store.subscribe(self) { (subscription) in
            subscription.select { (appstate) in appstate.listRestaurantsState }
        }
    }
}

// MARK: - Coordinator
final class ListRestaurantsCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return _rootViewController
    }
    var childCoordinators: [Coordinator] = []
    
    private let _rootViewController: UINavigationController
    private let listRestaurantsStateSubscriber = ListRestaurantsSubscriber()
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(_ rootViewController: UINavigationController) {
        self._rootViewController = rootViewController
    }
    
    func start() {
        guard let nearest = rootViewController.children.first as? ListRestaurantsViewController else {
            return
        }
        nearest.navigation = self
        self.listRestaurantsStateSubscriber
            .state
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { (state) in
                nearest.state = state
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Navigation
extension ListRestaurantsCoordinator: ListRestaurantsNavigation {
    func showRestaurantDetails(with restaurant: Restaurant) {
        store.dispatch(NavigationAction.Restaurants.showRestaurantsDetails(restaurant: restaurant))
    }
    
    func showFilters() {
        store.dispatch(NavigationAction.Filters.filters(_rootViewController))
    }
}

extension ListRestaurantsCoordinator: RestaurantPresenter {
    func present(restaurant: Restaurant) {
        let vc = RestaurantDetailsViewController(tenant: TenantsCellViewModel(name: restaurant.name, image: UIImage()))
        
        _rootViewController.pushViewController(vc, animated: true)
    }
}

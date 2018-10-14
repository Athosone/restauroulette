//
//  RestaurantsCoordinator.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import UIKit
import Application
import ReSwift
import RxSwift

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

//final class RestaurantDetailSubscriber: StoreSubscriber {
//    typealias StoreSubscriberStateType = RestaurantDetailState
//
//}


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

extension ListRestaurantsCoordinator: ListRestaurantsNavigation {
    func showRestaurantDetails() {
        
    }
    
    func showFilters() {
        store.dispatch(NavigationAction.filters(_rootViewController))
    }    
}


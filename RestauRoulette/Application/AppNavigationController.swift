//
//  AppNavigationController.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import ReSwift

final class AppNavigationContoller {
    init() {
        self.subscribeToNavigationState()
    }
}

extension AppNavigationContoller: StoreSubscriber {
    typealias StoreSubscriberStateType = NavigationState
    
    func newState(state: NavigationState) {
        state.coordinator?.start()
    }
    
    func subscribeToNavigationState() {
        store.subscribe(self) { (subscription) in
            subscription.select { (appstate) in appstate.navigationState }
        }
    }
}



//
//  RestaurantsCoordinator.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import UIKit

final class ListRestaurantsCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return _rootViewController
    }
    var childCoordinators: [Coordinator] = []
    
    private let _rootViewController: UINavigationController
    
    init(_ rootViewController: UINavigationController) {
        self._rootViewController = rootViewController
    }
    
    func start() {
        guard let nearest = rootViewController.children.first as? ListRestaurantsViewController else {
            return
        }
        nearest.navigation = self
    }
}

extension ListRestaurantsCoordinator: ListRestaurantsNavigation {
    func showRestaurantDetails() {
        
    }
    
    func showFilters() {
        store.dispatch(NavigationAction.filters(_rootViewController))
    }    
}


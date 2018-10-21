//
//  RootSceneCoordinator.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit

// Base coordinator for all sub views
final class RootSceneCoordinator: NSObject, Coordinator {
    var rootViewController: UIViewController {
        return _rootViewController
    }
    
    var childCoordinators: [Coordinator] = []    
    private let _rootViewController: TabBarController
    
    init(_ rootViewController: TabBarController) {
        self._rootViewController = rootViewController
    }
    
    func start() {
        let firstSceneVC = UIStoryboard.init(name: "RestaurantScene", bundle: nil).instantiateInitialViewController()! as! UINavigationController
        _rootViewController.setViewControllers([firstSceneVC], animated: true)
        _rootViewController.delegate = self
        store.dispatch(NavigationAction.Restaurants.listRestaurantsScene(firstSceneVC))
    }
}

extension RootSceneCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

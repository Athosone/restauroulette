//
//  AppCoordinator.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit
import Application
import ReSwift

final class AppCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return _rootViewController
    }
    
    var childCoordinators: [Coordinator] = []
    
    private let _rootViewController: TabBarController
    private let window: UIWindow
    
    init(window: UIWindow, launchingOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.window = window
        _rootViewController = TabBarController()
    }
    
    func start() {
        let rootsceneCoordinator = RootSceneCoordinator(_rootViewController)
        childCoordinators.append(rootsceneCoordinator)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        store.dispatch(NavigationAction.rootScene(rootsceneCoordinator))
    }
}


//
//  FiltersCoordinator.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import UIKit

final class FiltersCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return _rootViewController
    }
    
    var childCoordinators: [Coordinator] = []

    private let _rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self._rootViewController = rootViewController
    }
    
    func start() {
        _rootViewController.present(UIViewController(), animated: true, completion: nil)
    }
}

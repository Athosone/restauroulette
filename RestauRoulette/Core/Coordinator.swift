//
//  Coordinator.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var rootViewController: UIViewController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func addChildCoordinator(_ child: Coordinator) {
        self.childCoordinators.append(child)
    }
    
    func remove(where predicate: (Coordinator) -> Bool) {
        self.childCoordinators.removeAll(where: predicate)
    }
}

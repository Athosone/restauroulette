//
//  NavigationState.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import ReSwift

struct NavigationState: StateType, Codable {
    let previousCoordinator: Coordinator?
    let coordinator: Coordinator?
    
    var currentCoordinatorId: String {
        return String(describing: coordinator)
    }
    
    var previousCoordinatorId: String {
        return String(describing: previousCoordinator)
    }
    
    init(_ previousCoordinator: Coordinator?, _ newCoordinator: Coordinator?) {
        self.coordinator = newCoordinator
        self.previousCoordinator = previousCoordinator
    }
    
    func encode(to encoder: Encoder) throws {}
    init(from decoder: Decoder) throws {
        coordinator = nil
        previousCoordinator = nil
    }
}

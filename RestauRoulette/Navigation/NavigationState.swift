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
    let coordinator: Coordinator?
    var coordinatorId: String {
        return String(describing: coordinator)
    }
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func encode(to encoder: Encoder) throws {}
    init(from decoder: Decoder) throws {
        coordinator = nil
    }
}

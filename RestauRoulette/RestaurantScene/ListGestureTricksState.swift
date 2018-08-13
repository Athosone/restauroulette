//
//  NearestRestaurantState.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import ReSwift
import Domain

struct ListGestureTricksState: StateType, Codable {
    var restaurants: [GestureTrick]?
}

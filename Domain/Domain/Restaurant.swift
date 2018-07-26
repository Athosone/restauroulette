//
//  Restaurant.swift
//  Domain
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation

public enum RestaurantType {
    case chinese
    case french
}

public struct Restaurant: Codable {
    let name: String
    let image: URL
}

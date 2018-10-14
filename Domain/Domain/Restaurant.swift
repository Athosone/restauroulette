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

public struct Restaurant: Codable, Equatable {
    public let name: String
    public let image: URL
    
    public init(name: String, image: URL) {
        self.name = name
        self.image = image
    }
}

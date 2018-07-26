//
//  SearchRestaurantUseCase.swift
//  Application
//
//  Created by Werck Ayrton on 25/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Domain
import CoreLocation
import RxSwift

public struct SearchRestaurantRequest {
    let useCurrentLocation: Bool
    let types: [RestaurantType]
}
public final class SearchRestaurantUseCase {
    
    private let positionRepository: PositionRepository
    
    init(positionRepository: PositionRepository) {
        self.positionRepository = positionRepository
    }
    
    func search(_ searchRestaurantRequest: SearchRestaurantRequest) -> Single<[Restaurant]> {
        positionRepository
            .currentLocation
            //.onNext(<#T##element: CLLocation##CLLocation#>)
        return Single.never()
    }
}

//
//  RestaurantRepository.swift
//  Application
//
//  Created by Werck Ayrton on 29/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import CoreLocation

public protocol RestaurantRepository {
    func searchRestaurant(by location: CLLocation) -> Single<[Restaurant]>
}

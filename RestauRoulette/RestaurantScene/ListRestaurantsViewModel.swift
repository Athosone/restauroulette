//
//  ListRestaurantViewModel.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 09/09/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Application

final class ListRestaurantsViewModel {
    
    private let tenantUseCase: TenantUseCase
    
    init(tenantUseCase: TenantUseCase) {
        self.tenantUseCase = tenantUseCase
    }
}

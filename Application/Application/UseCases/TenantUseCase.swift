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

public final class TenantUseCase {
    
    private let tenantRepository: TenantRepository
    
    public init(tenantRepository: TenantRepository) {
        self.tenantRepository = tenantRepository
    }
}

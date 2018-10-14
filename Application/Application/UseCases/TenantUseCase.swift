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
    
    public func fetchTenants(searchTerm: String) -> Single<[Restaurant]> {
        //return tenantRepository.searchTenantBy(term: searchTerm)
        return Observable
            .just([Restaurant(name: searchTerm, image: URL(string: "https://toto.com")!)])
            .asSingle()
    }
}

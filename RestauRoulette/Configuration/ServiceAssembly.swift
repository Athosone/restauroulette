//
//  ServiceAssembly.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 14/10/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Swinject
import Application
import Infrastructure

final class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(TenantRepository.self, factory: { (resolver) -> TenantRepository in
            return YelpRepository(urlSession: nil)
        })
        container.register(TenantUseCase.self) { (resolver) -> TenantUseCase in
            return TenantUseCase(tenantRepository: resolver.resolve(TenantRepository.self)!)
        }
    }
    
}

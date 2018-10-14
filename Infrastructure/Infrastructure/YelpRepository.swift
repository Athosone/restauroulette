//
//  YelpRepository.swift
//  Infrastructure
//
//  Created by Werck Ayrton on 29/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Application
import Domain
import CoreLocation
import RxSwift
import NetworkInfrastructure

public final class YelpRepository: TenantRepository {
    
    static let apiKey = "NJzdiaOCCPtVjYEz5u7McMaIMPsRfkmSlRR14t7pljQ9Onoqsaia7lYVs_hSMEII3EvvijViK4a2P5SNLcvJsjefY4CGFifMiw0uDPIH49k6LvTmcxd2zaH2yydZW3Yx"
    private let networker: Networker?
    
    public init(urlSession: URLSession? = nil) {
        networker = nil
    }
    
    public func searchTenantBy(location: CLLocation) -> Single<[Restaurant]> {
        return Single.never()
    }
    
    public func searchTenantBy(term: String) -> Single<[Restaurant]> {
        return Single.never()
    }
}

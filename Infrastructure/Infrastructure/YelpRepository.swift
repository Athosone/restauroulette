//
//  YelpRepository.swift
//  Infrastructure
//
//  Created by Werck Ayrton on 29/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Application
import RxSwift

public final class YelpRepository: SearchRepository {
    
    static let apiKey = "NJzdiaOCCPtVjYEz5u7McMaIMPsRfkmSlRR14t7pljQ9Onoqsaia7lYVs_hSMEII3EvvijViK4a2P5SNLcvJsjefY4CGFifMiw0uDPIH49k6LvTmcxd2zaH2yydZW3Yx"
    
    public func searchTenant(by location: CLLocation) -> Single<[Restaurant]> {
        
    }
}

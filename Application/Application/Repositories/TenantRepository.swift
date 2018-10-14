//
//  TenantRepository.swift
//  Application
//
//  Created by Werck Ayrton on 09/09/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation
import Domain

public protocol TenantRepository {
    func searchTenantBy(location: CLLocation) -> Single<[Restaurant]>
    func searchTenantBy(term: String) -> Single<[Restaurant]>
}

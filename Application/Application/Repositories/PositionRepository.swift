//
//  PositionRepository.swift
//  Application
//
//  Created by Werck Ayrton on 25/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation

public protocol PositionRepository {
    
    var currentLocation: PublishSubject<CLLocation> { get }
    
    func initialize() -> Single<Bool>
    func startUpdate()
}

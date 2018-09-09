//
//  PositionImp.swift
//  PositionInfrastructure
//
//  Created by Werck Ayrton on 25/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Application
import RxSwift
import CoreLocation

final class PositionImp: PositionRepository {
    private var _currentLocation: PublishSubject<CLLocation> = PublishSubject()
    
    public let currentLocation: Observable<CLLocation> = {
        return _currentLocation.asObservable()
    }
    
    func initialize() -> Single<Bool> {
        return Single.never()
    }
    
    func startUpdate() {
        
    }
}

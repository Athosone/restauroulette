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
    var currentLocation: PublishSubject<CLLocation> = PublishSubject()
    
    func initialize() -> Single<Bool> {
        return Single.never()
    }
    
    func startUpdate() {
        
    }
    
    
    
    
}

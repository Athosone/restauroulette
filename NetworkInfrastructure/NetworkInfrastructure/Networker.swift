//
//  Networker.swift
//  NetworkInfrastructure
//
//  Created by Werck Ayrton on 29/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import RxSwift

final public class Networker {
    
    private let urlSession: URLSession
    
    public init(urlSession: URLSession? = nil) {
        self.urlSession = urlSession ?? makeUrlSession()
    }
    
    private func makeUrlSession(configuration: URLSessionConfiguration? = nil) {
        let urlSession = URLSession(configuration: configuration ?? makeDefaultConfiguration())
    }
    
    private func makeDefaultConfiguration() -> URLSessionConfiguration {
        
    }
}


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
        self.urlSession = urlSession ?? Networker.makeUrlSession()
    }
    
    private static func makeUrlSession(configuration: URLSessionConfiguration? = nil) -> URLSession {
        let urlSession = URLSession(configuration: configuration ?? makeDefaultConfiguration())
        return urlSession
    }
    
    private static func makeDefaultConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration()
        return configuration
    }
}


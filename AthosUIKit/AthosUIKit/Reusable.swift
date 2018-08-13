//
//  Reusable.swift
//  Application
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation

public protocol ReuseProvider {
    static var reuseID: String { get }
    var reuseID: String { get }
}


public extension ReuseProvider {
    public static var reuseID: String {
        return String(describing: Self.self)
    }
    
    public var reuseID: String {
        return String(describing: Self.self)
    }
}

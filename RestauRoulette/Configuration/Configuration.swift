//
//  Configuration.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 14/10/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import Swinject

final class Configuration {
    static let shared: Configuration = Configuration(container: Container())
    
    let container: Container
    var resolver: Resolver {
        return container as Resolver
    }
    init(container: Container) {
        self.container = container
    }
    
    func configure() {
        let assemblies = [ServiceAssembly()]
        assemblies.forEach { (assembly) in
            assembly.assemble(container: container)
        }
    }
}

//
//  curry.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation

func curry<A,B,C,D>(_ fn: @escaping (A, B, C) -> D) -> (A) -> (B, C) -> D {
    return { a in
        return { b, c in
            return fn(a, b, c)
        }
    }
}

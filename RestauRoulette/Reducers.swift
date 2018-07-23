//
//  Reducers.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 22/07/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import ReSwift

func combineReducers<T>(_ first: @escaping Reducer<T>, _ remainder: Reducer<T>...) -> Reducer<T> {
    return { action, state in
        let firstResult = first(action, state)
        let result = remainder.reduce(firstResult) { result, reducer in
            return reducer(action, result)
        }
        return result
    }
}

//
//  Outcome.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/23/23.
//

import Foundation

public enum ServiceOutcome<T> {
    case Success([T])
    case Error(T)
}

public enum NetworkOutcome {
    case Success(HttpResponse)
    case Error(HttpResponse)
}

extension NetworkOutcome {
    func get() throws -> HttpResponse {
        switch self {
        case let .Success(value):
            return value
        case let .Error(error):
            print("error")
            return error
        }
    }
}

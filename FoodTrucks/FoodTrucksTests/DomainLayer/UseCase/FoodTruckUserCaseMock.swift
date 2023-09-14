//
//  FoodTruckUserCaseMock.swift
//  FoodTrucksTests
//
//  Created by Nandkishore Kanhere on 9/25/23.
//

import Foundation
@testable import FoodTrucks

class FoodTruckUseCaseMock: FoodTruckUserCaseProtocol {
    var invokedFoodTruck = false
    var invokedFoodTruckCount = 0
    var invokedFoodTruckParameters: (request: FoodTruck.Request, Void)?
    var stubbedFoodTruckCompletionHandlerResult: (ServiceOutcome<FoodTruck.Response>)?
    
    func fatchFoodTruckRequest(request: FoodTruck.Request, completion: @escaping (ServiceOutcome<FoodTruck.Response>) -> Void) {
        invokedFoodTruck = true
        invokedFoodTruckCount = 1
        invokedFoodTruckParameters = (request, ())
        if let result = stubbedFoodTruckCompletionHandlerResult {
            completion(result)
        }
    }
}

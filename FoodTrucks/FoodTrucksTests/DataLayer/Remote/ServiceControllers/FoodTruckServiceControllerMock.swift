//
//  FoodTruckServiceControllerMock.swift
//  FoodTrucksTests
//
//  Created by Nandkishore Kanhere on 9/25/23.
//

import Foundation
@testable import FoodTrucks

class FoodTruckServiceControllerMock: FoodTruckServiceControllerProtocol {
    private var foodTruckResponse: [FoodTruck.Response]?
    private var error: Error?

    init(
        foodTruckResponse: [FoodTruck.Response]? = nil,
        error: Error? = nil
    ) {
        self.foodTruckResponse = foodTruckResponse
        self.error = error
    }

    func fatchFoodTrucksResuest(request: FoodTruck.Request, completion: @escaping (ServiceOutcome<FoodTruck.Response>) -> Void) {
        if let foodTruckResponse = self.foodTruckResponse {
            completion(.Success(foodTruckResponse))
            return
        }
    }
}

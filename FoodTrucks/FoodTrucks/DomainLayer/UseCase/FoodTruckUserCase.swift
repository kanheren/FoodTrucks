//
//  FoodTruckUserCase.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/23/23.
//

import Foundation

protocol FoodTruckUserCaseProtocol {
    func fatchFoodTruckRequest(request: FoodTruck.Request,
                               completion: @escaping (ServiceOutcome<FoodTruck.Response>) -> Void)
}

class FoodTruckUserCase: FoodTruckUserCaseProtocol {
    
    func fatchFoodTruckRequest(request: FoodTruck.Request,
                               completion: @escaping (ServiceOutcome<FoodTruck.Response>) -> Void) {
        
        AppEnvironment.current.foodTruckServiceController.fatchFoodTrucksResuest(request: request,
                                                                                 completion: { response in
            switch response {
            case let .Success(success):
                print("Success: \(success)")
                completion(.Success(success))
            case .Error(_):
                print("error")
            }
        })
    }
}

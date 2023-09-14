//
//  Environment.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/23/23.
//

import Foundation

struct Environment {

    // Use Case
    let foodTruckUserCase: FoodTruckUserCaseProtocol
    
    // Service Controller
    let foodTruckServiceController: FoodTruckServiceControllerProtocol
    
    // Helper, Singleton and Factory
    let networkContextFactory: NetworkContextFactoryProtocol
    
    init(
        foodTruckUserCase: FoodTruckUserCaseProtocol = FoodTruckUserCase(),
        foodTruckServiceController: FoodTruckServiceControllerProtocol = FoodTruckServiceController(),
        networkContextFactory: NetworkContextFactoryProtocol = NetworkContextFactory()
    ) {
        self.foodTruckUserCase = foodTruckUserCase
        self.foodTruckServiceController = foodTruckServiceController
        self.networkContextFactory = networkContextFactory
    }
}

//
//  ViewController_Presenter.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/23/23.
//

import Foundation

protocol ViewController_PresenterProtocol: AnyObject {
    func fatchFoodTrucksData()
}

class ViewController_Presenter: ViewController_PresenterProtocol {
    
    var foodTruckArray = [FoodTruck.Response]()
    weak var viewController: ViewController_ViewControllerProtocol?

    required init(_ viewController: ViewController_ViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func fatchFoodTrucksData() {
        let foodTruckRequest = FoodTruck.Request()
        
        AppEnvironment.current.foodTruckUserCase.fatchFoodTruckRequest(request: foodTruckRequest, completion: { result in
            switch result {
            case let .Success(successObject):
                print("Food Truck success object")
                self.viewController?.foodTruckResponse(foodTruckResponse: successObject)
            case .Error(_):
                print("error")
            }
        })
    }

}

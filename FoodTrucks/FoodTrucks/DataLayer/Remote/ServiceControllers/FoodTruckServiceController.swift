//
//  FoodTruckServiceController.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/23/23.
//

import Foundation

protocol FoodTruckServiceControllerProtocol {
    func fatchFoodTrucksResuest(request: FoodTruck.Request,
                             completion: @escaping (_ response: ServiceOutcome<FoodTruck.Response>) -> Void)
}

class FoodTruckServiceController: FoodTruckServiceControllerProtocol {
    
    func fatchFoodTrucksResuest(request: FoodTruck.Request,
                             completion: @escaping (ServiceOutcome<FoodTruck.Response>) -> Void) {
        let requestBuilder = HttpRequestRestBuilder()
        requestBuilder.httpRequest.serviceName = "Food Truck"
        requestBuilder.httpRequest.serviceType = .external
        requestBuilder.httpRequest.uri = "https://data.sfgov.org/resource/jjew-r69b.json"
        requestBuilder.httpRequest.method = .get
        requestBuilder.httpRequest.dataBody = nil
        
        let requestDirector = HttpRequestDirector(httpRequestBuilder: requestBuilder)
        
        let httpRequest = requestDirector.constructHTTPRequest()
        
        let networkContext = AppEnvironment.current.networkContextFactory.getNetworkContext(withStrategy: HttpNetworkStrategy())
        networkContext.connect(httpRequest: httpRequest, serviceControllerCallback: { outcome in
            self.decode(FoodTruck.Response.self, fromOutcome: outcome, completion: completion)
        })
    }
    
    private func decode<T>(_: T.Type,
                           fromOutcome outcome: NetworkOutcome,
                           completion: @escaping (_ response: ServiceOutcome<T>) -> Void) where T: Decodable {
        do {
            let response = try outcome.get()

            // a response without data is treated as malformed
            guard let data = response.data else { return }

            let decodedResponse = try JSONDecoder().decode([T].self, from: data)
            completion(.Success(decodedResponse))

            } catch {
                // network failure or request
                print("FoodTruckServiceController error")
        }
    }
}

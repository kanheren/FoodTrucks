//
//  HttpNetworkStrategy.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/24/23.
//

import Foundation

class HttpNetworkStrategy: NetworkStrategy {
    override func connect(httpRequest: HttpRequest, contextCallback: @escaping (NetworkOutcome) -> Void) {
        self.httpRequest = httpRequest

        let networkManager = NetworkManager()

        networkManager.sendRequest(httpRequest: httpRequest, strategyCallback: { outcome in
            // return response to network context class
            contextCallback(outcome)
        })
    }
}

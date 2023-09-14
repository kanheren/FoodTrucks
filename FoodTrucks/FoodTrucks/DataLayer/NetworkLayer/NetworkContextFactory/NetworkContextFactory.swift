//
//  NetworkContextFactory.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/24/23.
//

import Foundation

protocol NetworkContextFactoryProtocol {
    func getNetworkContext(withStrategy networkStrategy: NetworkStrategy) -> NetworkContextProtocol
}

class NetworkContextFactory: NetworkContextFactoryProtocol {
    func getNetworkContext(withStrategy networkStrategy: NetworkStrategy) -> NetworkContextProtocol {
        FXSNetworkContext(withStrategy: networkStrategy)
    }
}

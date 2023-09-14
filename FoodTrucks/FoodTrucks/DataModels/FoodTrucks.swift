//
//  FoodTrucks.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/17/23.
//

import Foundation

public struct FoodTruck {
    
    //Response
    public struct Response: Codable {
        var applicant: String
        var location: String
        var starttime: String
        var endtime: String
        var optionaltext: String?
        var latitude: String
        var longitude: String
    }
    
    //Request
    public struct Request: Codable {
    }
}

//
//  FoodTruckModel.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/17/23.
//

import Foundation

struct FoodTruckModel {
    var applicant: String
    var location: String
    var startTime: String
    var endTime: String
    var optionalText: String
    var latitude: String
    var longitude: String
    
    init(applicant: String, location: String, startTime: String, endTime: String, optionalText: String,
         latitude: String, longitude: String) {
        self.applicant = applicant
        self.location = location
        self.startTime = startTime
        self.endTime = endTime
        self.optionalText = optionalText
        self.latitude = latitude
        self.longitude = longitude
    }
}

//
//  FoodTruckAnnotation.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/17/23.
//

import Foundation
import MapKit

class FoodTruckAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let discipline: String?
    let foodTruck: FoodTruckModel?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        foodTruck: FoodTruckModel?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.foodTruck = foodTruck
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return foodTruck?.applicant
    }
}

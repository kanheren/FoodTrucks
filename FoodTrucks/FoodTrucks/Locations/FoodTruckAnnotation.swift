//
//  FoodTruckAnnotation.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/17/23.
//

import Foundation
import MapKit

class FoodTruckAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    let locationName: String?
    let foodTruck: FoodTruckModel?
    
    init(title: String?,
        subtitle: String?,
        coordinate: CLLocationCoordinate2D,
        locationName: String?,
        foodTruck: FoodTruckModel?
    ) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        self.locationName = locationName
        self.foodTruck = foodTruck
       
        super.init()
    }
}

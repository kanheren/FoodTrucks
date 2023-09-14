//
//  MapViewControllerTest.swift
//  FoodTrucksTests
//
//  Created by Nandkishore Kanhere on 9/18/23.
//

import XCTest
@testable import FoodTrucks

class MapViewControllerTest: XCTestCase {

    func testFoodTrucksCountZero() {
        let mapViewController = MapViewController()
        XCTAssertEqual(mapViewController.FoodTrucks.count, 0, "Must be 0")
    }
    func testFoodTrucksCounts() {
        var tempFoodTruckArray = [FoodTruckModel]()
        let foodTruck1 = FoodTruckModel(applicant: "1", location: "1", startTime: "10AM", endTime: "6PM", optionalText: "", latitude: "1.11", longitude: "-1.11")
        let foodTruck2 = FoodTruckModel(applicant: "2", location: "2", startTime: "10AM", endTime: "6PM", optionalText: "", latitude: "2.22", longitude: "-22.22")
        tempFoodTruckArray.append(foodTruck1)
        tempFoodTruckArray.append(foodTruck2)
        let mapViewController = MapViewController()
        mapViewController.FoodTrucks = tempFoodTruckArray
        XCTAssertEqual(mapViewController.FoodTrucks.count, 2, "Must be 0")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

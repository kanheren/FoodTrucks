//
//  FoodTrucksUITestsLaunchTests.swift
//  FoodTrucksUITests
//
//  Created by Nandkishore Kanhere on 9/16/23.
//

import XCTest

class FoodTrucksUITestsLaunchTests: XCTestCase {
    let app = XCUIApplication()
    let device = XCUIDevice.shared
    
    // Test tap on Display
    func testListViewControllerLaunch() throws {
        app.launch()
        app.buttons["Display"].tap()
        app.navigationBars.element.buttons["Map"].tap()
        device.orientation = UIDeviceOrientation.portrait
    }
    // Test tap on Display
    func testMapButtonTap() throws {
        app.launch()
        app.buttons["Display"].tap()
        app.navigationBars.element.buttons["Map"].tap()
        device.orientation = UIDeviceOrientation.portrait
    }
    // Test tap on Display
    func testListButtonTap() throws {
        app.launch()
        app.buttons["Display"].tap()
        app.navigationBars.element.buttons["Map"].tap()
        app.navigationBars.element.buttons["List"].tap()
        device.orientation = UIDeviceOrientation.portrait
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app.terminate()
        device.orientation = UIDeviceOrientation.portrait
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app.launch()
        device.orientation = UIDeviceOrientation.portrait
    }

    func testLaunch() throws {
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
        device.orientation = UIDeviceOrientation.portrait
    }
    
}

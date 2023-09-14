//
//  HttpResponse.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/24/23.
//

import Foundation

public class HttpResponse {
    var data: Data?
    var httpURLResponse: HTTPURLResponse?
    var timeOfResponse: Date?

    init(data: Data?, httpURLResponse: HTTPURLResponse?, timeOfResponse: Date?) {
        self.data = data
        self.httpURLResponse = httpURLResponse
        self.timeOfResponse = timeOfResponse
    }
}

public class HttpError {
    var data: Data?

    init(data: Data?) {
        self.data = data
    }
}

//
//  HttpRequestBuilder.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/24/23.
//

import Foundation

class HttpRequestBuilder: HttpRequestBuilderDelegate {
    var httpRequest = HttpRequest()
    var userDefaults = UserDefaults.standard

    func buildURI() {
        NSException(name: NSExceptionName(rawValue: "Invoked abstract method"),
                    reason: "Invoked abstract method in FXSHttpRequestBuilder", userInfo: nil).raise()
    }

    func buildBody() {
        NSException(name: NSExceptionName(rawValue: "Invoked abstract method"),
                    reason: "Invoked abstract method in FXSHttpRequestBuilder", userInfo: nil).raise()
    }

    func buildHeaders() {
        NSException(name: NSExceptionName(rawValue: "Invoked abstract method"),
                    reason: "Invoked abstract method in FXSHttpRequestBuilder", userInfo: nil).raise()
    }

    func fetchHttpRequest() -> HttpRequest {
        httpRequest
    }
}

//
//  HttpRequestDirector.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/24/23.
//

import Foundation

class HttpRequestDirector {
    var httpRequestBuilder: HttpRequestBuilder!

    init(httpRequestBuilder: HttpRequestBuilder) {
        self.httpRequestBuilder = httpRequestBuilder
    }

    func constructHTTPRequest() -> HttpRequest {
        httpRequestBuilder.buildURI()
        httpRequestBuilder.buildBody()
        httpRequestBuilder.buildHeaders()

        return httpRequestBuilder.httpRequest
    }
    func constructHTTPRequestVirtual() -> HttpRequest {
        httpRequestBuilder.buildBody()
        httpRequestBuilder.buildHeaders()

        return httpRequestBuilder.httpRequest
    }
}

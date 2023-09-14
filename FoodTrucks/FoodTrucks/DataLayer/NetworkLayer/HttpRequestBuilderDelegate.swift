//
//  HttpRequestBuilderDelegate.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/24/23.
//

import Foundation

protocol HttpRequestBuilderDelegate: AnyObject {

    var httpRequest: HttpRequest { get set }
    
    func buildURI()
    func buildBody()
    func buildHeaders()
}

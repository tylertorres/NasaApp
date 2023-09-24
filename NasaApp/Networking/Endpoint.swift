//
//  Endpoint.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Foundation

protocol Endpoint {
    var url: URL? { get }
}

extension Endpoint {
    var baseUrl: URL {
        return URL(string: "https://api.nasa.gov")!
    }
}

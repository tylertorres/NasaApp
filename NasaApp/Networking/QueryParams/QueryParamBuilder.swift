//
//  QueryParamBuilder.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Foundation


struct QueryParamBuilder {
    
    private var params: [QueryParamKey: String?] = [:]
    
    mutating func add(key: QueryParamKey, value: String?) {
        params[key] = value
    }
    
    func build() -> [URLQueryItem] {
        params.compactMap { (key: QueryParamKey, value: String?) in
            guard let value = value else { return nil }
            return URLQueryItem(name: key.rawValue, value: value)
        }
    }
}

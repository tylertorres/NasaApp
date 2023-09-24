//
//  APODEndpoint.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Foundation


struct APODEndpoint: Endpoint {
    
    let queryParams: [URLQueryItem]
    
    let path = "/planetary/apod"
    
    var url: URL? {
        var urlComponents = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryParams
        return urlComponents?.url
    }
    
}

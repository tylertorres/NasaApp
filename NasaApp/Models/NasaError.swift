//
//  NasaError.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Foundation


enum NasaError: Error {
    case networkError(String)
    case decodingError
    case invalidURL
    case unknown
    
    /// Image related
    case imageDataFailure
    
}

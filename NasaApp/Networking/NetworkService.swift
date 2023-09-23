//
//  NetworkService.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//


import Combine
import Foundation

protocol NetworkService {
    func fetchData<T:Decodable>(ofType type: T.Type, for endpoint: Endpoint) -> AnyPublisher<T, NasaError>
}

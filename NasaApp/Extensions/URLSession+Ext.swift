//
//  URLSession+Ext.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Combine
import Foundation


extension URLSession: NetworkSession {
    func execute(_ request: URLRequest) -> AnyPublisher<Data, Error> {
        return dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}

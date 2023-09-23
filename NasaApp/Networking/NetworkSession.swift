//
//  NetworkSession.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Combine
import Foundation

protocol NetworkSession {
    func execute(_ request: URLRequest) -> AnyPublisher<Data, Error>
}

//
//  NasaNetworkService.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Combine
import Foundation

class NasaNetworkService: NetworkService {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchData<T>(ofType type: T.Type, for endpoint: Endpoint) -> AnyPublisher<T, NasaError> where T : Decodable {
        guard let url = endpoint.url else {
            return Fail(error: NasaError.invalidURL).eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        
        return urlSession.execute(request)
            .mapError(handleNetworkError)
            .decode(type: type, decoder: JSONDecoder())
            .mapError { _ in NasaError.decodingError }
            .eraseToAnyPublisher()
    }
    
    private func handleNetworkError(_ error: Error) -> NasaError {
        
        if let error = error as? URLError {
            switch error.code {
            case .badServerResponse:
                return NasaError.networkError("Error occurred with the server")
            case .networkConnectionLost, .notConnectedToInternet:
                return NasaError.networkError("Error occured with internet connection")
            default:
                return NasaError.unknown
            }
        } else {
            return NasaError.unknown
        }
    }
}




//
//  NasaViewModel.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Combine
import Foundation

class NasaViewModel: ObservableObject {
    
    // need image data from the network call
    private var cancellables = Set<AnyCancellable>()
    
    let networkService: NetworkService
    var apiKey: String = ""
    
    init(networkService: NetworkService = NasaNetworkService()) {
        self.networkService = networkService
        
        if let infoDict = Bundle.main.infoDictionary, let apiKey = infoDict["API_KEY"] as? String {
            self.apiKey = apiKey
        }
    }
    
    
    func fetchAPOD() {
        guard !apiKey.isEmpty else {
            print("Cannot call nasa api without an api key")
            return
        }
        
        let apodQueryParams = createQueryParams()
        let apodEndpoint = APODEndpoint(queryParams: apodQueryParams)
        
        networkService.fetchData(ofType: APOD.self, for: apodEndpoint)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] apod in
                print(apod)
            }
            .store(in: &cancellables)
        
    }
    
    private func createQueryParams() -> [URLQueryItem] {
        var queryParamBuilder = QueryParamBuilder()
        queryParamBuilder.add(key: .apiKey, value: apiKey)
        return queryParamBuilder.build()
    }
    
}

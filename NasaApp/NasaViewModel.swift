//
//  NasaViewModel.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Combine
import Foundation
import UIKit
import SwiftUI

class NasaViewModel: ObservableObject {
    
    @Published var apod: APOD?
    @Published var image: UIImage?
    
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
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] apod in
                self?.apod = apod
                
                if let url = URL(string: apod.url) {
                    self?.loadImage(from: url)
                }
            }
            .store(in: &cancellables)
        
    }
    
    private func loadImage(from url: URL) {
        networkService.fetchImageData(from: url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Something went wrong when fetching image: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] imageData in
                self?.image = UIImage(data: imageData)
            }
            .store(in: &cancellables)
    }
    
    private func createQueryParams() -> [URLQueryItem] {
        var queryParamBuilder = QueryParamBuilder()
        queryParamBuilder.add(key: .apiKey, value: apiKey)
        queryParamBuilder.add(key: .date, value: "2023-09-23")
        return queryParamBuilder.build()
    }
    
}

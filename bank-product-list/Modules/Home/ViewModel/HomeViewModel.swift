//
//  HomeViewModel.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {

    private let apiClient: APIClientProtocol

    var spotlightItems: [SpotlightItem] = []
    var products: [ProductItem] = []
    var cash: CashItem?

    var didUpdateData: (() -> Void)?
    var didFailWithError: ((Error) -> Void)?

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchStoreData() {
        apiClient.fetchStoreData { [weak self] result in
            switch result {
            case .success(let storeResponse):
                self?.spotlightItems = storeResponse.spotlight
                self?.products = storeResponse.products
                self?.cash = storeResponse.cash
                self?.didUpdateData?()
            case .failure(let error):
                self?.didFailWithError?(error)
            }
        }
    }
}

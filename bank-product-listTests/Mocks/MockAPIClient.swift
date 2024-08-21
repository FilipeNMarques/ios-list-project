//
//  MockAPIClient.swift
//  bank-product-listTests
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

@testable import bank_product_list

final class MockAPIClient: APIClientProtocol {

    var fetchStoreDataResult: Result<StoreResponseItem, NetworkError>?

    func fetchStoreData(completion: @escaping (Result<StoreResponseItem, NetworkError>) -> Void) {
        if let result = fetchStoreDataResult {
            completion(result)
        }
    }
}

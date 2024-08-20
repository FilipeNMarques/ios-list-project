//
//  APIClientProtocol.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

protocol APIClientProtocol: AnyObject {
    func fetchStoreData(completion: @escaping (Result<StoreResponseItem, NetworkError>) -> Void)
}

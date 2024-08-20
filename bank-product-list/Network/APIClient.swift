//
//  APIClient.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

final class APIClient: APIClientProtocol {
    func fetchStoreData(completion: @escaping (Result<StoreResponseItem, NetworkError>) -> Void) {
        request(endpoint: .products, completion: completion)
    }

    private func request<T: Codable>(endpoint: APIEndpoints, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: endpoint.url) else {
            completion(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch let decodingError {
                print("Decoding error: \(decodingError)")
                completion(.failure(.decodingError(decodingError)))
            }
        }

        task.resume()
    }
}

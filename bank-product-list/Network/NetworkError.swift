//
//  NetworkError.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case noData
    case decodingError(Error)

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .requestFailed(let error):
            return "The request failed with error: \(error.localizedDescription)"
        case .invalidResponse:
            return "The response was invalid."
        case .noData:
            return "No data was returned."
        case .decodingError(let error):
            return "Failed to decode the response with error: \(error.localizedDescription)"
        }
    }
}

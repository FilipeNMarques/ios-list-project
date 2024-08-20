//
//  APIEndpoints.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

enum APIEndpoints: String {
    static let baseURL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox"

    case products = "/products"

    var path: String {
        return self.rawValue
    }

    var url: String {
        return APIEndpoints.baseURL + self.path
    }
}

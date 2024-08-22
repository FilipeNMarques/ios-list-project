//
//  ProductItem.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

struct ProductItem: Codable {
    let name: String
    let imageURL: String
    let description: String
}

extension ProductItem: DetailConvertibleProtocol {
    func toItemDetail() -> ItemDetail {
        return ItemDetail(title: name, description: description, imageURL: imageURL)
    }
}

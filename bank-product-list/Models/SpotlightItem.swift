//
//  SpotlightItem.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

struct SpotlightItem: Codable {
    let name: String
    let bannerURL: String
    let description: String
}

extension SpotlightItem: DetailConvertibleProtocol {
    func toItemDetail() -> ItemDetail {
        return ItemDetail(title: name, description: description, imageURL: bannerURL)
    }
}

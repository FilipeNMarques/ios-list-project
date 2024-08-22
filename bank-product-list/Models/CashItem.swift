//
//  CashItem.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

struct CashItem: Codable {
    let title: String
    let bannerURL: String
    let description: String
}

extension CashItem: DetailConvertibleProtocol {
    func toItemDetail() -> ItemDetail {
        return ItemDetail(title: title, description: description, imageURL: bannerURL)
    }
}

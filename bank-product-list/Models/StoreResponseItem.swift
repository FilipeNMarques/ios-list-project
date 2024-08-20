//
//  StoreResponseItem.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

struct StoreResponseItem: Codable {
    let spotlight: [SpotlightItem]
    let products: [ProductItem]
    let cash: CashItem
}

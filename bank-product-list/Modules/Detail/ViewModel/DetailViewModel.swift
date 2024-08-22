//
//  DetailViewModel.swift
//  bank-product-list
//
//  Created by Filipe Marques on 22/08/24.
//

import Foundation

final class DetailViewModel: DetailViewModelProtocol {
    private let item: ItemDetail

    var itemDetail: ItemDetail {
        return item
    }

    init(item: ItemDetail) {
        self.item = item
    }
}

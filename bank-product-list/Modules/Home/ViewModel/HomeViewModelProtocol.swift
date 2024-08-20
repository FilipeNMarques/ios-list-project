//
//  HomeViewModelProtocol.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    var spotlightItems: [SpotlightItem] { get }
    var products: [ProductItem] { get }
    var cash: CashItem? { get }

    var didUpdateData: (() -> Void)? { get set }
    var didFailWithError: ((Error) -> Void)? { get set }

    func fetchStoreData()
}

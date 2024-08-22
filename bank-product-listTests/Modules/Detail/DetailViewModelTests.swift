//
//  DetailViewModelTests.swift
//  bank-product-listTests
//
//  Created by Filipe Marques on 22/08/24.
//

import XCTest

@testable import bank_product_list

final class DetailViewModelTests: XCTestCase {

    func testDetailViewModelInitialization() {
        let itemDetail = ItemDetail(title: "Test Title", description: "Test Description", imageURL: "https://example.com/image.png")

        let viewModel = DetailViewModel(item: itemDetail)

        XCTAssertEqual(viewModel.itemDetail.title, "Test Title")
        XCTAssertEqual(viewModel.itemDetail.description, "Test Description")
        XCTAssertEqual(viewModel.itemDetail.imageURL, "https://example.com/image.png")
    }

    func testDetailConvertibleProtocol() {
        let spotlightItem = SpotlightItem(name: "Spotlight Title", bannerURL: "https://example.com/banner.png", description: "Spotlight Description")
        let productItem = ProductItem(name: "Product Name", imageURL: "https://example.com/product.png", description: "Product Description")
        let cashItem = CashItem(title: "Cash Title", bannerURL: "https://example.com/cash.png", description: "Cash Description")

        let spotlightDetail = spotlightItem.toItemDetail()
        let productDetail = productItem.toItemDetail()
        let cashDetail = cashItem.toItemDetail()

        XCTAssertEqual(spotlightDetail.title, "Spotlight Title")
        XCTAssertEqual(spotlightDetail.description, "Spotlight Description")
        XCTAssertEqual(spotlightDetail.imageURL, "https://example.com/banner.png")

        XCTAssertEqual(productDetail.title, "Product Name")
        XCTAssertEqual(productDetail.description, "Product Description")
        XCTAssertEqual(productDetail.imageURL, "https://example.com/product.png")

        XCTAssertEqual(cashDetail.title, "Cash Title")
        XCTAssertEqual(cashDetail.description, "Cash Description")
        XCTAssertEqual(cashDetail.imageURL, "https://example.com/cash.png")
    }
}

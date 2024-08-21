//
//  HomeViewModelTests.swift
//  bank-product-listTests
//
//  Created by Filipe Marques on 20/08/24.
//

import XCTest
@testable import bank_product_list

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockAPIClient: MockAPIClient!

    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        viewModel = HomeViewModel(apiClient: mockAPIClient)
    }

    override func tearDown() {
        viewModel = nil
        mockAPIClient = nil
        super.tearDown()
    }

    func testFetchStoreData_Success() {
        let spotlightItems = [SpotlightItem(
            name: "Test",
            bannerURL: "https://test.com",
            description: "Test description"
        )]
        let products = [ProductItem(
            name: "Product 1",
            imageURL: "https://test.com/product1.png",
            description: "Product 1 description"
        )]
        let cash = CashItem(
            title: "Test Cash",
            bannerURL: "https://test.com/cash.png",
            description: "Test cash description"
        )
        let storeResponse = StoreResponseItem(
            spotlight: spotlightItems,
            products: products,
            cash: cash
        )

        mockAPIClient.fetchStoreDataResult = .success(storeResponse)

        let expectation = expectation(description: "didUpdateData is called")

        viewModel.didUpdateData = { expectation.fulfill() }
        viewModel.fetchStoreData()

        waitForExpectations(timeout: 1.0)

        XCTAssertEqual(viewModel.spotlightItems.count, 1)
        XCTAssertEqual(viewModel.products.count, 1)
        XCTAssertNotNil(viewModel.cash)
    }

    func testFetchStoreData_Failure() {
        let error = NetworkError.requestFailed(
            NSError(domain: "bank_product_list-unit-test", code: 1, userInfo: nil)
        )

        mockAPIClient.fetchStoreDataResult = .failure(error)

        let expectation = expectation(description: "didFailWithError is called")

        viewModel.didFailWithError = { receivedError in
            if case NetworkError.requestFailed(let receivedError) = receivedError,
               case NetworkError.requestFailed(let expectedError) = error {
                XCTAssertEqual((receivedError as NSError).domain, (expectedError as NSError).domain)
                XCTAssertEqual((receivedError as NSError).code, (expectedError as NSError).code)
            } else {
                XCTFail("Expected NetworkError.requestFailed, but got \(receivedError)")
            }

            expectation.fulfill()
        }

        viewModel.fetchStoreData()

        waitForExpectations(timeout: 1.0)
    }
}

//
//  GlobalAlertTests.swift
//  bank-product-listTests
//
//  Created by Filipe Marques on 22/08/24.
//

import XCTest

@testable import bank_product_list

final class GlobalAlertTests: XCTestCase {

    func testShowDefaultAlert() {
        let viewController = UIViewController()
        let window = UIWindow()

        window.rootViewController = viewController
        window.makeKeyAndVisible()

        GlobalAlert.showDefault(
            on: viewController,
            title: "Test Title",
            message: "Test Message",
            actionTitle: "Test Action"
        )

        XCTAssertEqual(viewController.presentedViewController is UIAlertController, true, "An alert controller should be presented")

        let alertController = viewController.presentedViewController as? UIAlertController
        XCTAssertEqual(alertController?.title, "Test Title", "The alert title should be 'Test Title'")
        XCTAssertEqual(alertController?.message, "Test Message", "The alert message should be 'Test Message'")
        XCTAssertEqual(alertController?.actions.first?.title, "Test Action", "The alert action title should be 'Test Action'")
    }
}

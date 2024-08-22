//
//  DetailViewUITests.swift
//  bank-product-listUITests
//
//  Created by Filipe Marques on 22/08/24.
//

import XCTest

final class DetailViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launch()

        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists, "The first cell in the table should exist")

        firstCell.tap()
    }

    func testDetailViewDisplaysContent() {
        let app = XCUIApplication()

        let imageView = app.images["DetailViewImageView"]
        let titleLabel = app.staticTexts["DetailViewTitleLabel"]
        let descriptionLabel = app.staticTexts["DetailViewDescriptionLabel"]

        XCTAssertTrue(imageView.exists, "The image should be present in the DetailView")
        XCTAssertTrue(titleLabel.exists, "The title should be present in the DetailView")
        XCTAssertTrue(descriptionLabel.exists, "The description should be present in the DetailView")
    }
}

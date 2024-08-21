//
//  HomeViewUITests.swift
//  bank-product-listUITests
//
//  Created by Filipe Marques on 20/08/24.
//

import XCTest

final class HomeViewUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testHomeScreenHasCorrectNumberOfSections() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        
        let numberOfSections = tablesQuery.otherElements.matching(identifier: "header-section").count

        
        XCTAssertEqual(numberOfSections, 2, "The number of sections should be 2")
    }
}

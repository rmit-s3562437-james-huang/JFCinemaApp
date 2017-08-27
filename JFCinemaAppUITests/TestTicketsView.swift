//
//  TestTicketsView.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 27/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import XCTest

class TestTicketsView: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        XCUIApplication().launch()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    // Before
    let app = XCUIApplication()
    
    func testEmptyTable() {
        app.tabBars.buttons["Sessions"].tap()
        let btnCount = app.buttons.count
        XCTAssertEqual(btnCount, 28)
    }
    
    func testTableRows() {
            let tablesQuery = app.tables
            let cells = tablesQuery.cells.count
            XCTAssert(cells == 4)
    }
    
    func testHomeTabExists() {
        app.tabBars.buttons["Home"].tap()
    }
    
    func testSessionsTabExists() {
        app.tabBars.buttons["Sessions"].tap()
    }
    
    func testMoviesTabExists() {
        app.tabBars.buttons["Movies"].tap()
    }
    
    func testTicketsTabExists() {
        app.tabBars.buttons["Tickets"].tap()
    }
    
    func testContactsTabExists() {
        app.tabBars.buttons["Contact"].tap()
    }
}

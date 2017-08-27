//
//  TestMainMenu.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 27/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import XCTest

class TestMainView: XCTestCase {
        
    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // Before
    let app = XCUIApplication()
    
    func testNumButtons() {
        
        let numButtons = app.buttons.count
        
        XCTAssertEqual(numButtons, 5)
    }
    
    func testHomeTabExists() {
        app.tabBars.buttons["Home"].tap()
    }
    
    func testNumTables() {
        let tableCount = app.tables.count
        XCTAssertEqual(tableCount, 1)
    }
    
    func testTableCells() {
        let tablesQuery = app.tables
        let cells = tablesQuery.cells.count
        XCTAssert(cells == 4)
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

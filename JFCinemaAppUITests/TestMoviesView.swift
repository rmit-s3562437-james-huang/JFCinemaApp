//
//  TestMoviesView.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 27/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import XCTest

class TestMoviesView: XCTestCase {
    
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
    
    func testCollectionViewCells(){
        app.tabBars.buttons["Movies"].tap()
        let cells = app.collectionViews.cells.count
        XCTAssertEqual(cells, 3)
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

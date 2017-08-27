//
//  TestMainContactsView.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 27/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import XCTest

class TestMainContactsView: XCTestCase {
        
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
    
    func testTexts(){
        app.tabBars.buttons["Contact"].tap()
        let texts = app.staticTexts.count

        XCTAssertEqual(texts, 4)
    }
    
    func testImage(){
        app.tabBars.buttons["Contact"].tap()
        let texts = app.images.count
        
        XCTAssertEqual(texts, 1)
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

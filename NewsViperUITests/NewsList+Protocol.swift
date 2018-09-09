//
//  NewsList+Protocol.swift
//  NewsViperUITests
//
//  Created by Saul Moreno Abril on 09/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import XCTest

protocol NewsList {
    func testNewsListView_hasNews()
    func testNewsListView_shouldSeeNewsDetailsOnceEntered()
    
}

extension NewsList {
    func givenAppIsLaunched() {
        XCUIApplication().launch()
    }
    func thenIShouldSeeNews() {
        XCTAssertTrue(XCUIApplication().buttons["Greet"].exists)
    }
    
    func whenITapNews() {
        
    }
    
    func thenIShouldSeeNewsDetails() {
        
    }
}

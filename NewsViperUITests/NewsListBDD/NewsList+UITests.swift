//
//  NewsViperUITests.swift
//  NewsViperUITests
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import XCTest

class NewsUITests: XCTestCase, NewsList {
        
    override func setUp() {
        super.setUp()
        
        givenAppIsLaunched()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsListView_hasNews() {
        
        thenIShouldSeeNews()
    }
    
    func testNewsListView_shouldSeeNewsDetails() {
        givenAppIsLaunched()
        whenITapNews()
        thenIShouldSeeNewsDetails()
    }
    
}

//
//  NewsList+Extension.swift
//  NewsViperUITests
//
//  Created by Saul Moreno Abril on 10/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import XCTest
import Nimble

extension NewsList {
    func givenAppIsLaunched() {
        let app = XCUIApplication()
        app.launch()
    }
    
    func thenIShouldSeeNews() {
        let app = XCUIApplication()
        
        // Get first cell
        let firstCell = app.tables.firstMatch.cells.firstMatch
        
        // News should be visible
        expect(firstCell.exists).to(beTrue())
    }
    
    func whenITapNews() {
        let app = XCUIApplication()
        
        // Tap news
        let firstCell = app.tables.firstMatch.cells.firstMatch
        if firstCell.exists {
            firstCell.tap()
        }
    }
    
    func thenIShouldSeeNewsDetails() {
        let app = XCUIApplication()
        let webView = app.webViews.firstMatch
        
        // Webview should be visible
        expect(webView.exists).to(beTrue())
    }
}

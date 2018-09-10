//
//  NewsViperUITests.swift
//  NewsViperUITests
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import XCTest
import Quick
import Nimble

class NewsUITests: QuickSpec {
    override func spec() {
        beforeSuite {
            self.givenAppIsLaunched()
        }
        
        afterSuite {
            
        }
        
        describe("given app is launched") {
            it("see news") {
                self.thenUserShouldSeeNews()
            }
            
            context("when user tap news") {
                it("details are shown") {
                    self.whenUserTapNews()
                    self.thenItShouldSeeNewsDetails()
                }
            }
        }
    }
    
    // TODO: Helpers
    
    func givenAppIsLaunched() {
        let app = XCUIApplication()
        app.launch()
    }
    
    func thenUserShouldSeeNews() {
        let app = XCUIApplication()
        
        // Get first cell
        let firstCell = app.tables.firstMatch.cells.firstMatch
        
        // News should be visible
        expect(firstCell.exists).to(beTrue())
    }
    
    func whenUserTapNews() {
        let app = XCUIApplication()
        
        // Tap news
        let firstCell = app.tables.firstMatch.cells.firstMatch
        if firstCell.exists {
            firstCell.tap()
        }
    }
    
    func thenItShouldSeeNewsDetails() {
        let app = XCUIApplication()
        let webView = app.webViews.firstMatch
        
        // Webview should be visible
        expect(webView.exists).to(beTrue())
    }

}

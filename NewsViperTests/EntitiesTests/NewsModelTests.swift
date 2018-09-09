//
//  NewsModelTests.swift
//  NewsViperTests
//
//  Created by Saul Moreno Abril on 09/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import XCTest
import Nimble
import SWXMLHash
@testable import NewsViper

class NewsModelTests: XCTestCase {
    var bundle: Bundle!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bundle = Bundle(for: type(of: self))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsModelMapping_fromXML() {
        guard let url = bundle.url(forResource: "OneNews", withExtension: "xml") else {
            XCTFail("Missing file: OneNews")
            return
        }
        
        let xmlString = try? String(contentsOf: url, encoding: .utf8)
        let xml = SWXMLHash.parse(xmlString!)
        
        let item = xml["item"].all.first
        let news: NewsModel = NewsModel(indexer: item!)
        
        expect(news.title).to(equal("Title"))
        expect(news.descriptionText).to(equal("Description"))
        expect(news.link).to(equal("https://example.com"))
        expect(news.pubDate).to(equal("Mon, 01 Jan 2018 00:00:00 GMT"))
        expect(news.imageURL).to(equal("https://example.com/example.png"))
    }
    
    func testNewsModelMappingPerformance_fromXML() {
        // Put the code you want to measure the time of here.
        guard let url = bundle.url(forResource: "OneNews", withExtension: "xml") else {
            XCTFail("Missing file: OneNews")
            return
        }
        
        self.measure {
            let xmlString = try? String(contentsOf: url, encoding: .utf8)
            let xml = SWXMLHash.parse(xmlString!)
            
            let item = xml["item"].all.first
            _ = NewsModel(indexer: item!)
        }
    }
    
}

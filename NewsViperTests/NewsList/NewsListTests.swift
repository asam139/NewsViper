//
//  NewsListTests.swift
//  NewsViperTests
//
//  Created by Saul Moreno Abril on 09/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import XCTest
import Nimble
@testable import NewsViper

class NewsListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsListProvider_retrievingNews() {
        let provider = NewsListPresenterMock()
        let interactor: NewsListInteractorInputProtocol & NewsListRemoteDataManagerOutputProtocol = NewsListInteractor()
        let dataRemote: NewsListRemoteDataManagerInputProtocol = NewsListRemoteDataManagerStub()
        
        provider.interactor = interactor
        interactor.presenter = provider
        interactor.remoteDatamanager = dataRemote
        dataRemote.remoteRequestHandler = interactor
        
        // Retrieve news list
        provider.viewNeedsUpdated()
        
        expect(provider.wasRetrievedNews).to(beTrue())
    }
    

}

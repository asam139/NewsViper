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
    var presenter:NewsListPresenterMock!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = NewsListPresenterMock()
        let interactor: NewsListInteractorInputProtocol & NewsListRemoteDataManagerOutputProtocol = NewsListInteractor()
        let dataRemote: NewsListRemoteDataManagerInputProtocol = NewsListRemoteDataManagerStub()
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = dataRemote
        dataRemote.remoteRequestHandler = interactor
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsListProvider_retrievingNews() {
        // Retrieve news list to update view
        presenter.viewNeedsUpdated()
        
        expect(self.presenter.wasRetrievedNews).to(beTrue())
    }
    
    func testNewsListProvider_countingNews() {
        // Retrieve news list to update view
        presenter.viewNeedsUpdated()
        
        expect(self.presenter.newsCount).to(equal(27))
    }
    
    func testNewsListProvider_errorRetrievingNews() {
        // Retrieve news list to update view
        let remoteDataManager = presenter.interactor?.remoteDatamanager as! NewsListRemoteDataManagerStub
        remoteDataManager.simulateError = true
        
        presenter.viewNeedsUpdated()
        
        expect(self.presenter.wasGettingError).to(beTrue())
    }
    

}

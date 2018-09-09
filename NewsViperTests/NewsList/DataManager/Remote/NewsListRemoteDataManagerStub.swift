//
//  NewsListRemoteDataManagerMock.swift
//  NewsViperTests
//
//  Created by Saul Moreno Abril on 09/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SWXMLHash
@testable import NewsViper

class NewsListRemoteDataManagerStub: NewsListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: NewsListRemoteDataManagerOutputProtocol?
    var simulateError: Bool = false
    
    func retrieveNewsList() {
        if (simulateError) {
            self.remoteRequestHandler?.onError()
        }
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "News", withExtension: "xml")  else {
            return
        }
        
        let xmlString = try? String(contentsOf: url, encoding: .utf8)
        let xml = SWXMLHash.parse(xmlString!)
        
        let items = xml["rss"]["channel"]["item"].all
        let news: [NewsModel] = NewsModel.mapArrayFrom(indexers: items)
        
        self.remoteRequestHandler?.onNewsRetrieved(news)
    }
}

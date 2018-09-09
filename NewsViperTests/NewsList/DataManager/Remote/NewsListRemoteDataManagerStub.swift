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
    
    func retrieveNewsList() {
        guard let url = Bundle.main.url(forResource: "News", withExtension: "xml") else {
            self.remoteRequestHandler?.onError()
            return
        }
        
        let xmlString = try? String(contentsOf: url, encoding: .utf8)
        let xml = SWXMLHash.parse(xmlString!)
        
        let items = xml["rss"]["channel"]["item"].all
        let news: [NewsModel] = NewsModel.mapArrayFrom(indexers: items)
        
        self.remoteRequestHandler?.onNewsRetrieved(news)
    }
}

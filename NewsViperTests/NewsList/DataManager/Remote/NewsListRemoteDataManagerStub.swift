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
        
        let testBundle = Bundle(for: type(of: self))
        let xmlPath = testBundle.path(forResource: "news", ofType: "xml")
        let fileURL = URL(fileURLWithPath: xmlPath!)
        let xmlString = try? String(contentsOf: fileURL, encoding: .utf8)
        
        if xmlString != nil {
            let xml = SWXMLHash.parse(xmlString!)
            
            let items = xml["rss"]["channel"]["item"].all
            let news: [NewsModel] = NewsModel.mapIndexerArray(indexers: items)
            
            self.remoteRequestHandler?.onNewsRetrieved(news)
        } else {
            self.remoteRequestHandler?.onError()
        }
    }
}

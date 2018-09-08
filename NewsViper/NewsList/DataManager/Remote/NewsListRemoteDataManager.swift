//
//  NewsListRemoteDataManager.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash

class NewsListRemoteDataManager: NewsListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: NewsListRemoteDataManagerOutputProtocol?
    
    // Private background queue
    fileprivate let queue = DispatchQueue(label: "\(Constants.bundleID).\(String(describing: NewsListInteractor.self))", qos: .background, attributes: .concurrent)
    
    func retrieveNewsList() {
        Alamofire.request(Endpoints.News.fetch.url).responseString(queue: queue) { response in
            if response.response?.statusCode == 200 {
                let xmlString = response.result.value!
                let xml = SWXMLHash.parse(xmlString)
                
                let items = xml["rss"]["channel"]["item"].all
                var news: [NewsModel] = []
                for item in items {
                    let model = NewsModel(indexer: item)
                    news.append(model)
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.remoteRequestHandler?.onNewsRetrieved(news)
                }
                
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.remoteRequestHandler?.onError()
                }
            }
        }
    }

}

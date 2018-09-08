//
//  NewsInteractor.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash

class NewsInteractor: NewsPresenterToInteractorProtocol {
    var presenter: NewsInteractorToPresenterProtocol?
    
    fileprivate let queue = DispatchQueue(label: "\(Constants.bundleID).\(String(describing: NewsInteractor.self))", qos: .background, attributes: .concurrent)
    
    func fetchNews() {
        Alamofire.request(Constants.apiURL).responseString(queue: queue) { response in
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
                    self?.presenter?.newsFetched(news: news)
                }
                
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.newsFetchedFailed();
                }
            }
        }
        
    }
}

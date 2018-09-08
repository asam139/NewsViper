//
//  NewsListInteractor.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

class NewsListInteractor: NewsListInteractorInputProtocol {
    var remoteDatamanager: NewsListRemoteDataManagerInputProtocol?
    var presenter: NewsListInteractorOutputProtocol?
    
    func retrieveNewsList() {
        
        // First retrieve from local model
        // Not implemented
        
        // If it is empty, retrieve from remote model
        remoteDatamanager?.retrieveNewsList()

    }
}

extension NewsListInteractor: NewsListRemoteDataManagerOutputProtocol {
    func onNewsRetrieved(_ news: [NewsModel]) {
        presenter?.didRetrieveNews(news)
    }
    
    func onError() {
        presenter?.onError()
    }
}

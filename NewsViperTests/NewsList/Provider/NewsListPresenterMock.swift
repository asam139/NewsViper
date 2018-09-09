//
//  NewsListPresenterMock.swift
//  NewsViperTests
//
//  Created by Saul Moreno Abril on 09/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
@testable import NewsViper

class NewsListPresenterMock: NewsListPresenterProtocol {
    weak var view: NewsListViewProtocol?
    var interactor: NewsListInteractorInputProtocol?
    var wireFrame: NewsListWireframeProtocol?
    var news: [NewsModel]?
    
    var wasGettingError: Bool = false
    var wasRetrievedNews: Bool = false
    
    func viewNeedsUpdated() {
        news = []
        
        interactor?.retrieveNewsList()
    }
    
    var newsCount: Int {
        return news!.count
    }
    
    func newsAt(index: Int) -> NewsModel {
        return news![index]
    }
    
    func showNewsDetailAt(index: Int) {
        
    }
}

extension NewsListPresenterMock: NewsListInteractorOutputProtocol {
    func didRetrieveNews(_ news: [NewsModel]) {
        self.news = news
        wasRetrievedNews = true
    }
    
    func onError() {
        wasGettingError = true
    }
}

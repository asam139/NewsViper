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
    
    var wasRetrievedNews: Bool = false
    
    func viewNeedsUpdated() {
        news = []
        
        interactor?.retrieveNewsList()
    }
    
    var newsCount: Int {
        return 1
    }
    
    func newsAt(index: Int) -> NewsModel {
        let newsModel = NewsModel()
        newsModel.title = "Title"
        newsModel.descriptionText = "Description"
        newsModel.link = "https://example.com"
        newsModel.pubDate = "Mon, 01 Jan 2018 00:00:00 GMT"
        newsModel.imageURL = "https://example.com/example.png"
        
        return newsModel
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

    }
}

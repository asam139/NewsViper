//
//  NewsListPresenter.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

class NewsListPresenter: NewsListPresenterProtocol {
    weak var view: NewsListViewProtocol?
    var interactor: NewsListInteractorInputProtocol?
    var wireFrame: NewsListWireframeProtocol?
    var news: [NewsModel]?
    
    
    func viewDidLoad() {
        news = []
        
        view?.showLoading()
        interactor?.retrieveNewsList()
    }
    
    var newsCount: Int {
        return (news?.count)!
    }
    
    func newsAt(index: Int) -> NewsModel {
        return news![index]
    }
    
    func showNewsDetailAt(index: Int) {
        let news = self.news![index]
        wireFrame?.presentNewsDetailScreen(from: view!, forNews: news)
    }
    
}

extension NewsListPresenter: NewsListInteractorOutputProtocol {
    func didRetrieveNews(_ news: [NewsModel]) {
        self.news = news
        view?.hideLoading()
        view?.refreshNews()
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}

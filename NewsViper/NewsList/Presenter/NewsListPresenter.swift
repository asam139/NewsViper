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
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveNewsList()
    }
    
    func showNewsDetail(forNews new: NewsModel) {
        
    }
}

extension NewsListPresenter: NewsListInteractorOutputProtocol {
    func didRetrieveNews(_ news: [NewsModel]) {
        view?.hideLoading()
        view?.showNews(news)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}

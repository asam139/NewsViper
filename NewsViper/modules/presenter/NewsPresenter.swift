//
//  NewsPresenter.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

class NewsPresenter {
    var view: NewsPresenterToViewProtocol?
    var interactor: NewsPresenterToInteractorProtocol?
    var router: NewsPresenterToRouterProtocol?
    
}

extension NewsPresenter: NewsViewToPresenterProtocol {
    func updateView() {
        interactor?.fetchNews()
    }
}


extension NewsPresenter: NewsInteractorToPresenterProtocol {
    
    
    func newsFetched(news: [NewsModel]) {
        
    }
    
    func newsFetchedFailed() {
        
    }
    
}

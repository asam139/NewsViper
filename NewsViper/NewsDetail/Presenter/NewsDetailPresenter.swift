//
//  NewsDetailPresenter.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

class NewsDetailPresenter: NewsDetailPresenterProtocol {
    weak var view: NewsDetailViewProtocol?
    var wireframe: NewsDetailWireframeProtocol?
    var news: NewsModel?
    
    func viewNeedsUpdated() {
        view?.showNewsDetail(forNews: news!)
    }

}

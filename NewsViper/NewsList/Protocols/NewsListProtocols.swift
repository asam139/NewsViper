//
//  NewsListProtocols.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import UIKit

protocol NewsListViewProtocol: class {
    var presenter: NewsListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showNews(_ news: [NewsModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol NewsListWireFrameProtocol: class {
    static func createNewsListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentNewsDetailScreen(from view: NewsListViewProtocol, forNews news: NewsModel)
}

protocol NewsListPresenterProtocol: class {
    var view: NewsListViewProtocol? { get set }
    var interactor: NewsListInteractorInputProtocol? { get set }
    var wireFrame: NewsListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showNewsDetail(forNews new: NewsModel)
}

protocol NewsListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveNews(_ news: [NewsModel])
    func onError()
}

protocol NewsListInteractorInputProtocol: class {
    var presenter: NewsListInteractorOutputProtocol? { get set }
    //var localDatamanager: NewsListLocalDataManagerInputProtocol? { get set }
    //var remoteDatamanager: NewsListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveNewsList()
}

protocol NewsListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

/*protocol NewsListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: NewsListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveNewsList()
}*/

/*protocol NewsListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onNewsRetrieved(_ news: [NewsModel])
    func onError()
}*/

/*protocol NewsListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveNewsList() throws -> [News]
    func saveNews(title: String, description: String, link: String, pubDate: String, imageUrl: String) throws
}*/

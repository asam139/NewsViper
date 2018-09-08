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

protocol NewsListWireframeProtocol: class {
    static func createNewsListModule() -> UIViewController
    // Presenter -> Wireframe
    func presentNewsDetailScreen(from view: NewsListViewProtocol, forNews news: NewsModel)
}

protocol NewsListPresenterProtocol: class {
    var view: NewsListViewProtocol? { get set }
    var interactor: NewsListInteractorInputProtocol? { get set }
    var wireFrame: NewsListWireframeProtocol? { get set }
    
    // View -> Presenter
    func viewDidLoad()
    func showNewsDetail(forNews news: NewsModel)
}

protocol NewsListInteractorOutputProtocol: class {
    // Interactor -> Presenter
    func didRetrieveNews(_ news: [NewsModel])
    func onError()
}

protocol NewsListInteractorInputProtocol: class {
    var presenter: NewsListInteractorOutputProtocol? { get set }
    var remoteDatamanager: NewsListRemoteDataManagerInputProtocol? { get set }
    //var localDatamanager: NewsListLocalDataManagerInputProtocol? { get set }
    
    // Presenter -> Interactor
    func retrieveNewsList()
}

protocol NewsListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: NewsListRemoteDataManagerOutputProtocol? { get set }
    
    // Interactor -> RemoteDataManager
    func retrieveNewsList()
}

protocol NewsListRemoteDataManagerOutputProtocol: class {
    // RemoteDataManager -> Interactor
    func onNewsRetrieved(_ news: [NewsModel])
    func onError()
}

/*protocol NewsListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveNewsList() throws -> [News]
    func saveNews(title: String, description: String, link: String, pubDate: String, imageUrl: String) throws
}*/

/*
protocol NewsListLocalDataManagerOutputProtocol: class {
    // LocalDataManager -> Interactor
    
}
*/

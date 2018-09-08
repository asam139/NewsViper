//
//  NewsListWireFrame.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import UIKit

class NewsListWireFrame: NewsListWireFrameProtocol {
    static func createNewsListModule() -> UIViewController {
        let navController = mainstoryboard.instantiateViewController(withIdentifier: "NewsNavigationController")
        if let view = navController.childViewControllers.first as? NewsListViewController {
            let presenter: NewsListPresenterProtocol & NewsListInteractorOutputProtocol = NewsListPresenter()
            let interactor: NewsListInteractorInputProtocol = NewsListInteractor()
            //let localDataManager: NewsListLocalDataManagerInputProtocol = NewsListLocalDataManager()
            //let remoteDataManager: NewsListRemoteDataManagerInputProtocol = NewsListRemoteDataManager()
            let wireFrame: NewsListWireFrameProtocol = NewsListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            //interactor.localDatamanager = localDataManager
            //interactor.remoteDatamanager = remoteDataManager
            //remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func presentNewsDetailScreen(from view: NewsListViewProtocol, forNews news: NewsModel) {
        
    }
    
}

//
//  NewsDetailWireframe.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailWireframe: NewsDetailWireframeProtocol {
    static func createNewsDetailModule(forNews news: NewsModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NewsDetailViewController")
        if let view = viewController as? NewsDetailViewController {
            let presenter: NewsDetailPresenterProtocol = NewsDetailPresenter()
            let wireframe: NewsDetailWireframeProtocol = NewsDetailWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.news = news
            presenter.wireframe = wireframe
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

}

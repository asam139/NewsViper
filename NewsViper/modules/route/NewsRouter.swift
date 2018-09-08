//
//  NewsRouter.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import UIKit

class NewsRouter: NewsPresenterToRouterProtocol {
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
    static func createModule() -> UIViewController {
        let viewController = mainstoryboard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        
        let presenter = NewsPresenter()
        let interactor = NewsInteractor()
        let router = NewsRouter()
        
        viewController.presenter = presenter;
        presenter.view = viewController;
        presenter.router = router;
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        let navController = UINavigationController.init(rootViewController: viewController)
        return navController;
    }
    
}

//
//  NewsDetailProtocols.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import UIKit

protocol NewsDetailViewProtocol: class {
    var presenter: NewsDetailPresenterProtocol? { get set }
    
    // Presenter -> view
    func showNewsDetail(forNews news:NewsModel)
}

protocol NewsDetailWireframeProtocol: class {
    static func createNewsDetailModule(forNews news: NewsModel) -> UIViewController
}

protocol NewsDetailPresenterProtocol: class {
    var view: NewsDetailViewProtocol? { get set }
    var wireframe: NewsDetailWireframeProtocol? { get set }
    var news: NewsModel? { get set }
    
    // View -> presenter
    func viewDidLoad()
}

//
//  NewsPresenterToInteractorProtocol.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

protocol NewsPresenterToInteractorProtocol: class {
    var presenter: NewsInteractorToPresenterProtocol? {get set}
    
    func fetchNews();
}

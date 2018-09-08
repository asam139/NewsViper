//
//  ViewToPresenterProtocol.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

protocol NewsViewToPresenterProtocol: class {
    var view: NewsPresenterToViewProtocol? {get set}
    
    func updateView();
}

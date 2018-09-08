//
//  NewsInteractor.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Alamofire

class NewsInteractor: NewsPresenterToInteractorProtocol {
    var presenter: NewsInteractorToPresenterProtocol?
    
    
    fileprivate let queue = DispatchQueue(label: "\(Constants.bundleID).\(String(describing: NewsInteractor.self))", qos: .background, attributes: .concurrent)
    
    func fetchNews() {
        Alamofire.request(Constants.apiURL).responseString(queue: queue) { response in
            if(response.response?.statusCode == 200){
                let string = response.result.value
                self.presenter?.newsFetched(news: [])
            } else {
                self.presenter?.newsFetchedFailed();
            }
        }
        
    }
}

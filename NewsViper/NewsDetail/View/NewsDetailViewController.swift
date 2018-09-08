//
//  NewsDetailViewController.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class NewsDetailViewController: UIViewController, NewsDetailViewProtocol {
    @IBOutlet fileprivate weak var webView: WKWebView!
    
    var presenter: NewsDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    
    func showNewsDetail(forNews news: NewsModel) {
        if let link = news.link {
            let request = URLRequest(url: URL(string: link)!)
            webView.load(request)
        }
    }
    
}

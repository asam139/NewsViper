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
import EZLoadingActivity

class NewsDetailViewController: UIViewController, NewsDetailViewProtocol {
    @IBOutlet fileprivate weak var webView: WKWebView!
    
    var presenter: NewsDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        presenter?.viewNeedsUpdated()
    }
    
    
    func showNewsDetail(forNews news: NewsModel) {
        if let link = news.link {
            // FIXME: Links of BCC present a bug which showing a black flickering
            // Tested with other pages and it does not happen
            let request = URLRequest(url: URL(string: link)!)
            webView.load(request)
        }
    }
    
}

extension NewsDetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        EZLoadingActivity.show("Loading...", disableUI: false)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        EZLoadingActivity.hide()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        EZLoadingActivity.hide(false, animated: true)
    }

}

